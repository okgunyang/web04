package com.okhospital.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.okhospital.dao.BoardDAO;
import com.okhospital.dto.BoardDTO;
import com.okhospital.util.Criteria;

@Service
public class BoardServiceImpl implements BoardService {

	//해당 dao 객체 주입
	@Autowired
	BoardDAO boardDao;
	
	@Override
	public List<BoardDTO> boardList() throws Exception {
		return boardDao.boardList();
	}
	
	@Override
	public List<BoardDTO> boardList2(Criteria cri) throws Exception {
		return boardDao.boardList2(cri);
	}

	@Override
	public BoardDTO boardRead(int seq) throws Exception {
		return boardDao.boardRead(seq);
	}

	@Override
	public void boardWrite(BoardDTO bdto) throws Exception {
		boardDao.boardWrite(bdto);
	}

	@Override
	public void boardUpdate(BoardDTO bdto) throws Exception {
		boardDao.boardUpdate(bdto);
	}

	@Override
	public void boardDelete(int seq) throws Exception {
		boardDao.boardDelete(seq);
	}

	@Override
	public int getTotalCount() throws Exception {
		return boardDao.getTotalCount();
	}
}