package com.AL.mars.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarsController {
	@RequestMapping("/")
	public String main() {
		return "MarsWeather.jsp";
	}

}
