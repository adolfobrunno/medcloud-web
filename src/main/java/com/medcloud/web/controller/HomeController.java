package com.medcloud.web.controller;

import java.util.Locale;

import javax.annotation.Resource;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.medcloud.core.persistence.services.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Resource
	MongoOperations mongoOperation;
	@Resource
	UserService userService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		
//		User user = userService.getByUsername("adolfobrunno");
//		user.setRole("ROLE_USER");
//		user.setPassword("123456");
//		userService.save(user);
//		System.out.println(user.getUsername());
//		System.out.println(user.getPassword());
//		System.out.println(user.getRole());
//		
		return "login";
	}
	
}
