package com.okhospital.util;

public class Criteria {

	private int pageNum;  // 페이지번호
	private int amount;   // 한 페이지당 글개수
	private int start;
	private int end;
	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum) {
		this.pageNum = pageNum;
		this.amount = 10;
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getStart() {
		setStart();
		return start;
	}

	public void setStart() {
		this.start = (this.pageNum*this.amount)-(this.amount-1);
	}

	public int getEnd() {
		setEnd();
		return end;
	}

	public void setEnd() {
		this.end = this.pageNum*this.amount;
	}
	
	public void setEnd(int totalCount) {
		this.end = totalCount;
	}
}