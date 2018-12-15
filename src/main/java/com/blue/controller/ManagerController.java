package com.blue.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.blue.configuration.Encryptor;
import com.blue.configuration.MyResponse;
import com.blue.service.UserService;


@Controller
public class ManagerController {
	@Autowired
	UserService service;
	@Autowired
	Encryptor encryptor;
	@Autowired
	MyResponse myResponse;
	@Autowired
    Environment environment;
	
	
	@RequestMapping(value = "/manager", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewArtist() {
		return "admin";
    }

}
