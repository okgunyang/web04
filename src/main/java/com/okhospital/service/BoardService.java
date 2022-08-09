package com.okhospital.service;

import java.util.List;

import com.okhospital.dto.BoardDTO;
import com.okhospital.util.Criteria;

public interface BoardService {
	//글 목록
	public List<BoardDTO> boardList() throws Exception;
	
	//글 목록2
	public List<BoardDTO> boardList2(Criteria cri) throws Exception;
	
	//글 상세보기
	public BoardDTO boardRead(int seq) throws Exception;
	
	//글 등록
	public void boardWrite(BoardDTO bdto) throws Exception;
	
	//글 수정
	public void boardUpdate(BoardDTO bdto) throws Exception;
	
	//글 삭제
	public void boardDelete(int seq) throws Exception;
	
	//전체 글 수 카운트
	public int getTotalCount() throws Exception;
}