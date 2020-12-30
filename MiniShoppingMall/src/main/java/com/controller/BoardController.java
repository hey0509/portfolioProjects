package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dto.BoardDTO;
import com.dto.PageDTO;
import com.dto.PageMaker;
import com.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService bService;

	// >>>>> 게시판 수정 페이지 이동
	@RequestMapping(value = "/boardUpdateView", method = RequestMethod.GET)
	public String boardUpdateView(BoardDTO bDTO, Model model) {
		model.addAttribute("boardUpdate", bService.boardRead(bDTO.getBno()));
		return "boardUpdateView";
	}

	// 게시글 수정
	@RequestMapping(value = "/boardUpdate", method = RequestMethod.GET)
	public String boardUpdate(BoardDTO bDTO) {
		bService.boardUpdate(bDTO);
		return "redirect:board";
	}

	// 게시글 삭제
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(BoardDTO bDTO) {
		bService.boardDelete(bDTO.getBno());
		return "redirect:board";
	}

	// 게시 내용 확인
	@RequestMapping(value = "/boardRead", method = RequestMethod.GET)
	public String boardRead(BoardDTO bDTO, Model model) {
		model.addAttribute("boardRead", bService.boardRead(bDTO.getBno()));
		return "boardRead";
	}

	// >>>>> 게시글 작성 페이지 이동
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String boardAdd(BoardDTO bDTO) {
		System.out.println("작성 페이지 호출 >>>>> " + bDTO);
		return "boardWrite";
	}

	// 게시글 작성 메소드
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(BoardDTO bDTO) {
		bService.boardAdd(bDTO);
		return "redirect:board";
	}

	// 게시글 목록
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String boardList(Model model, PageDTO pageDTO) {
		model.addAttribute("boardList", bService.boardList(pageDTO));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPage(pageDTO);
		pageMaker.setTotalCount(bService.listCount());
		model.addAttribute("pageMaker", pageMaker);
		return "board";
	}
}
