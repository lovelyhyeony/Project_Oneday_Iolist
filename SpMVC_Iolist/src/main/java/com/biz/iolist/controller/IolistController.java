package com.biz.iolist.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.iolist.mapper.IolistDao;
import com.biz.iolist.model.IolistVO;
import com.biz.iolist.service.IolistService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class IolistController {

	@Qualifier("iolistServiceV1")
	private final IolistService iolistService;

	public IolistController(IolistService iolistService) {
		this.iolistService = iolistService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model) {
		List<IolistVO> iolist = iolistService.selectAll();
		model.addAttribute("IOLIST", iolist);
		return "home";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(@ModelAttribute IolistVO iolistVO, Model model) {

		model.addAttribute("LOCATION","INSERT");
		model.addAttribute("BODY", "IOLIST-WRITE");
		
		return "home";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(@ModelAttribute IolistVO iolistVO, Model model, String s) {
		LocalDateTime localDate = LocalDateTime.now();
		String date = DateTimeFormatter.ofPattern("yyyy-MM-dd").format(localDate);
		String time = DateTimeFormatter.ofPattern("HH:mm:ss").format(localDate);

		iolistVO.setIo_date(date);
		iolistVO.setIo_time(time);
		model.addAttribute("iolistVO", iolistVO);

		log.debug("정보 입력 : {}", iolistVO.toString());
		int ret = iolistService.insert(iolistVO);
		return "redirect:/";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@RequestParam("seq") String seq, Model model) {
		IolistVO iolistVO = iolistService.findBySeq(Long.valueOf(seq));

		model.addAttribute("ioVO", iolistVO);
		model.addAttribute("BODY", "IOLIST-DETAIL");
		return "home";
	}
	
	@RequestMapping(value = "/delete", method=RequestMethod.GET)
	public String delete(@RequestParam("seq") String seq) {
		
		iolistService.delete(Long.valueOf(seq));
		return "redirect:/";
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.GET)
	public String update(@RequestParam("seq") String seq, Model model) {
		
		IolistVO iolistVO = iolistService.findBySeq(Long.valueOf(seq));
		model.addAttribute("iolistVO", iolistVO);
		model.addAttribute("LOCATION","UPDATE");
		model.addAttribute("BODY", "IOLIST-WRITE");
		
		return "home";
	}
	
	@RequestMapping(value = "/update", method=RequestMethod.POST)
	public String update(@ModelAttribute IolistVO iolistVO, Model model) {
		int ret = iolistService.update(iolistVO);
		
		model.addAttribute("seq", iolistVO.getSeq());
		return "redirect:/";
	}
}
