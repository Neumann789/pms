package com.pms.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BossPageController {
	
	@RequestMapping("")
	public String index1(){
		return "index";
	}
	
	@RequestMapping("/")
	public String index2(){
		return "index";
	}
	
	
	@RequestMapping("/pageForward")
	public String pageForward(String pageForward){
		return pageForward;
	}
	
	
	
}
