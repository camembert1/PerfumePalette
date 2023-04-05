package com.kh.perfumePalette.perfume;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/perfume")
public class PerfumeController {
	
	@Autowired
	private PerfumeService pService;

}
