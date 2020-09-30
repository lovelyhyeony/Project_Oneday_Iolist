package com.biz.iolist.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.iolist.model.IolistVO;
import com.biz.iolist.service.IolistService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
public class IolistController {
	
	@Qualifier("iolistServiceV1")
	private final IolistService iolistService;
	
	@RequestMapping(value = "/iolist", method=RequestMethod.GET)
	public String list(Model model) {
		List<IolistVO> iolist = iolistService.selectAll();
		model.addAttribute("IOLIST", iolist);
		return "home";
	}
	
	@RequestMapping(value = "/write", method=RequestMethod.GET)
	public String write(@ModelAttribute IolistVO iolistVO ,Model model) {
		
		model.addAttribute("BODY", "IOLIST-WRITE");
		return "home";
	}
	
	@RequestMapping(value = "/write", method=RequestMethod.POST)
	public String write(@ModelAttribute IolistVO iolistVO, Model model, String s) {
		LocalDate localDate = LocalDate.now();
		String date = DateTimeFormatter
				.ofPattern("yyyy-MM-dd").format(localDate);
		String time = DateTimeFormatter
				.ofPattern("hh:mm:ss").format(localDate);
		
		iolistVO = IolistVO.builder()
				.io_date(date)
				.io_time(time)
				.build();
		
		model.addAttribute("BODY", "IOLIST-WRITE");
		model.addAttribute("iolistVO",iolistVO);
		log.debug("정보 입력 : {}", iolistVO.toString());
		int ret = iolistService.insert(iolistVO);
		return "home";
	}
}
