package com.example.demo.controller;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
public class HelloController {

	@GetMapping("/")
	public String hello() {
		return "hello_0";
	}

	@GetMapping("/1")
	public String hello1() {
		return "hello_1";
	}

	@GetMapping("/2")
	public String hello2() {
		return "hello_22";
	}

}
