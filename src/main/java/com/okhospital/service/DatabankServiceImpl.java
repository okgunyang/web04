package com.okhospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.okhospital.dao.DatabankDAO;
import com.okhospital.dto.DatabankDTO;

@Service
public class DatabankServiceImpl implements DatabankService {

	@Autowired
	DatabankDAO databankDAO;
	
	@Override
	public List<DatabankDTO> databankList() throws Exception {
		return databankDAO.databankList();
	}

	@Override
	public DatabankDTO databankRead(int datano) throws Exception {
		return databankDAO.databankRead(datano);
	}

	@Override
	public void databankWrite(DatabankDTO ddto) throws Exception {
		databankDAO.databankWrite(ddto);
	}

	@Override
	public void databankUpdate(DatabankDTO ddto) throws Exception {
		databankDAO.databankUpdate(ddto);
	}

	@Override
	public void databankDelete(int datano) throws Exception {
		databankDAO.databankDelete(datano);
	}
}
