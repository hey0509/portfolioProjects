package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BoardDAO;
import com.dto.BoardDTO;
import com.dto.PageDTO;

@Service
public class BoardService {

	@Autowired
	BoardDAO bDAO;

	// 게시글 수정
	public void boardUpdate(BoardDTO bDTO) {
		bDAO.boardUpdate(bDTO);
	}

	// 게시글 삭제
	public void boardDelete(int bno) {
		bDAO.boardDelete(bno);
	}

	// 게시 내용 조회
	public BoardDTO boardRead(int bno) {
		return bDAO.boardRead(bno);
	}

	// 게시글 작성
	public void boardAdd(BoardDTO bDTO) {
		bDAO.boardAdd(bDTO);
	}

	// 게시글 목록
	public List<BoardDTO> boardList(PageDTO pageDTO) {
		return bDAO.boardList(pageDTO);
	}

	// 게시물 총 갯수
	public int listCount() {
		return bDAO.listCount();
	}
}
