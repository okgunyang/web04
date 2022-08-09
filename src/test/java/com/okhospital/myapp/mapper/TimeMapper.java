package com.okhospital.myapp.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	@Select("SELECT to_char(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM dual")
	public String getTime1();
}