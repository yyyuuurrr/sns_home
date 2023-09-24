package com.cona.sns.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@GetMapping("input-view")
	public String input() {
		return "post/input";
	}
	
	@GetMapping("post-view")
	public String post() {
		return "post/post";
	}
}
