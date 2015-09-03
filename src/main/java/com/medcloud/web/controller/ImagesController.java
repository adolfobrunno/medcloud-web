package com.medcloud.web.controller;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.medcloud.core.entities.Directory;
import com.medcloud.core.entities.Directory.DirectoryJson;
import com.medcloud.core.entities.Image;
import com.medcloud.core.enums.ImageType;
import com.medcloud.core.persistence.services.DirectoryService;
import com.medcloud.core.persistence.services.ImageService;
import com.medcloud.core.persistence.services.ImageService.ImageDownload;
import com.medcloud.core.persistence.services.ImageService.ImageFilterDTO;
import com.medcloud.core.persistence.services.UserService;

@Controller
@RequestMapping(value="/images")
public class ImagesController {

	@Resource
	private ImageService imageService;
	@Resource
	private UserService userService;
	@Resource
	private DirectoryService directoryService;
	
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String load(Model model, HttpServletRequest request){
		model.addAttribute("modalities", ImageType.values());
		return "images_user";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String create(Model model, HttpServletRequest request){
		
		model.addAttribute("userToken", userService.getLoggedUser().getToken());
		model.addAttribute("types", ImageType.values());
		
		return "new_image_form";
	}
	
	@RequestMapping(value="/tree", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String getTree(HttpServletRequest request, HttpServletResponse response){
		
		DirectoryDTO dto = new DirectoryDTO();
		
		List<Directory> directories = directoryService.getAll();
		response.setStatus(HttpStatus.OK.value());
		
		for (Directory directory : directories) {
			dto.addTree(directory.toDirectoryJson());
		}
		
		return dto.getJson();
		
	}
	
	@RequestMapping(value="/get/", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String getBySNO(@RequestParam(value = "pid") String pid, @RequestParam("sid") String sid,
			@RequestParam("sno") String sno, HttpServletRequest request, HttpServletResponse response){
		
		List<Image> images = imageService.getByTree(pid, sno, sid);
		
		ImageUserDTO dto = new ImageUserDTO();
		dto.properties = images;
		
		return dto.toJson();
	}
	
	@RequestMapping(value="/filter", method=RequestMethod.POST, produces={MediaType.APPLICATION_JSON_VALUE})
	@ResponseBody
	public String filter(@RequestBody ImageFilterDTO dto, HttpServletRequest request){
		
		List<Image> images = imageService.filter(dto);
		
		ImageUserDTO returnDto = new ImageUserDTO();
		returnDto.properties = images;
		
		return returnDto.toJson();
	}
	
	@RequestMapping(value="/download/{iids:.+}", method = RequestMethod.GET)
    public void doDownload(@PathVariable("iids") String iids, HttpServletRequest request, 
    		HttpServletResponse response) throws IOException {
		
		String[] array = iids.split(",");
		List<String> list = new ArrayList<String>();
		for (String s : array) {
			list.add(s);
		}

		int BUFFER_SIZE = 4096;
		
		ImageDownload toDownload = imageService.zipImages(list, request.getSession().getServletContext());
		
		BufferedInputStream inputStream = new BufferedInputStream(new FileInputStream(toDownload.getFilePath()));
        String mimeType = "application/octet-stream";
 
        response.setContentType(mimeType);
        response.setContentLength((int) inputStream.available());
 
        String headerKey = "Content-Disposition";
        String headerValue = String.format("attachment; filename=\"%s\"",
                toDownload.getFileName());
        response.setHeader(headerKey, headerValue);
 
        OutputStream outStream = response.getOutputStream();
 
        byte[] buffer = new byte[BUFFER_SIZE];
        int bytesRead = -1;
 
        while ((bytesRead = inputStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, bytesRead);
        }
 
        inputStream.close();
        outStream.close();
        toDownload.deleteFile();
	}
	
	public class ImageUserDTO{
		
		List<Image> properties;
		
		public String toJson(){
			Gson gson = new Gson();
			return gson.toJson(this);
		}
		
	}
	
	public class DirectoryDTO{
		
		List<DirectoryJson> data = new ArrayList<DirectoryJson>();
		
		public void addTree(DirectoryJson e){
			this.data.add(e);
		}
		
		public String getJson(){
			Gson gson = new GsonBuilder().create();
			return gson.toJson(this);
		}
		
	}
	
}
