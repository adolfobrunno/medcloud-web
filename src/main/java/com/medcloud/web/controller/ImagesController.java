package com.medcloud.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.medcloud.core.entities.Image;
import com.medcloud.core.enums.ImageType;
import com.medcloud.core.persistence.services.ImageService;
import com.medcloud.core.persistence.services.UserService;

@Controller
@RequestMapping(value="/images")
public class ImagesController {

	@Resource
	private ImageService imageService;
	@Resource
	private UserService userService;
	
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String load(Model model, HttpServletRequest request){
		
		List<Image> images = imageService.loadByLoggedUser(request.getSession().getServletContext());
		model.addAttribute("images", images);
		
		return "images_user";
	}
	
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String create(Model model, HttpServletRequest request){
		
		model.addAttribute("userToken", userService.getLoggedUser().getToken());
		model.addAttribute("types", ImageType.values());
		
		return "new_image_form";
	}
	
	public class ImageUserDTO{
		
		Image properties;
		String file64;
		
	}
	
}
