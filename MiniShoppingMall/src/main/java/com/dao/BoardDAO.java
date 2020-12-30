package com.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;
import com.dto.PageDTO;

@Repository
public class BoardDAO {

	@Autowired
	SqlSessionTemplate template;

	// 게시글 수정
	public void boardUpdate(BoardDTO bDTO) {
		int n = template.update("BoardMapper.boardUpdate", bDTO);
		System.out.println("update count >>>>> " + n);
	}

	// 게시글 삭제
	public void boardDelete(int bno) {
		int n = template.delete("BoardMapper.boardDelete", bno);
		System.out.println("delete count >>>>> " + n);
	}

	// 게시 내용 조회
	public BoardDTO boardRead(int bno) {
		BoardDTO bDTO = template.selectOne("BoardMapper.boardRead", bno);
		return bDTO;
	}

	// 게시글 작성
	public void boardAdd(BoardDTO bDTO) {
		int n = template.insert("BoardMapper.boardAdd", bDTO);
		System.out.println("insert count >>>>> " + n);
	}

	// 게시글 목록 확인
	public List<BoardDTO> boardList(PageDTO pageDTO) {
		List<BoardDTO> list = template.selectList("BoardMapper.listPage", pageDTO);
		return list;
	}

	// 게시물 총 갯수
	public int listCount() {
		int listCount = template.selectOne("BoardMapper.listCount");
		return listCount;
	}
}
