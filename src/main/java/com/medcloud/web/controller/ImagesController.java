package com.medcloud.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		Image image = imageService.getByTree(pid, sno, sid);
		
		ImageUserDTO dto = new ImageUserDTO();
		dto.properties = image;
		dto.file64 = imageService.downloadImage(image, request.getSession().getServletContext());
		
		return dto.toJson();
	}
	
	
	public class ImageUserDTO{
		
		Image properties;
		String file64;
		
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
