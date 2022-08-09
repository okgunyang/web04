package com.okhospital.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.okhospital.dto.BoardDTO;
import com.okhospital.util.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	//해당 프로그램이 필요하면 알아서 사용하게 되어 스스로 제어하게 됨 => IoC(Inverse of Control : 제어의 역전)
	//객체 주입
	@Autowired
	SqlSession sqlSession;  //boardMapper.xml의 내용을 include한 것 같은 효과가 있음
	
	@Override
	public List<BoardDTO> boardList() throws Exception {
		return sqlSession.selectList("board.boardList");
	}

	@Override
	public List<BoardDTO> boardList2(Criteria cri) throws Exception {
		return sqlSession.selectList("board.boardList2", cri);
	}
	
	@Override
	public BoardDTO boardRead(int seq) throws Exception {
		return sqlSession.selectOne("board.boardRead", seq);
	}

	@Override
	public void boardWrite(BoardDTO bdto) throws Exception {
		sqlSession.insert("board.boardWrite", bdto);
	}

	@Override
	public void boardUpdate(BoardDTO bdto) throws Exception {
		sqlSession.update("board.boardUpdate", bdto);
	}

	@Override
	public void boardDelete(int seq) throws Exception {
		sqlSession.delete("board.boardDelete", seq);
	}

	@Override
	public int getTotalCount() throws Exception {
		return sqlSession.selectOne("board.totalCount");
	}
}
