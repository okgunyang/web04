package com.okhospital.myapp;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class JDBCTest {
	JDBCConn t1 = new JDBCConn();
	
	@Test
	void test() {
		t1.testConnection();
	}
}