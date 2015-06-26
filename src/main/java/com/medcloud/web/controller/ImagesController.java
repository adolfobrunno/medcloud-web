package com.medcloud.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.medcloud.core.entities.Image;
import com.medcloud.core.persistence.services.ImageService;

@Controller
@RequestMapping(value="/images")
public class ImagesController {

	@Resource
	private ImageService imageService;
	
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String load(Model model){
		
		List<Image> images = imageService.loadByLoggedUser();
		model.addAttribute("images", images);
		
		return "images_user";
	}
	
}
