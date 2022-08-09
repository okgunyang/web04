package com.okhospital.myapp;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.okhospital.myapp.mapper.TimeMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/**/root-context.xml")
public class MybatisTest {
	
	@Autowired
	private TimeMapper timeMapper;
		
	@Test
	void mybatisTest() {
		System.out.println(timeMapper.getClass().getName());
		System.out.println(timeMapper.getTime1());
		//fail("Not yet implemented");
	}
}
