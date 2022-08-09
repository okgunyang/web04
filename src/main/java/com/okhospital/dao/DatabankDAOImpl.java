package com.okhospital.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.okhospital.dto.DatabankDTO;

@Repository
public class DatabankDAOImpl implements DatabankDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<DatabankDTO> databankList() throws Exception {
		return sqlSession.selectList("databank.databankList");
	}

	@Override
	public DatabankDTO databankRead(int datano) throws Exception {
		return sqlSession.selectOne("databank.databankRead", datano);
	}

	@Override
	public void databankWrite(DatabankDTO ddto) throws Exception {
		sqlSession.insert("databank.databankWrite", ddto);
	}

	@Override
	public void databankUpdate(DatabankDTO ddto) throws Exception {
		sqlSession.update("databank.databankUpdate", ddto);
	}

	@Override
	public void databankDelete(int datano) throws Exception {
		sqlSession.delete("databank.databankDelete", datano);
	}
}