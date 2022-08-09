package com.okhospital.dto;

import com.okhospital.util.Criteria;

public class PageDTO {
	private int startPage; // 시작페이지
	private int endPage;   // 끝페이지
	private boolean prev, next;  // 이전, 다음
	private int total;  // 전체 글개수
	private Criteria cri; // 요청한 페이지번호, 한페이지당 글개수
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		// 여기서 5는 페이지블록을 구성하는 페이지 개수
		this.endPage =  (int) Math.ceil(cri.getPageNum() / 5.0) * 5;
		this.startPage = this.endPage - (5-1);
		// 실제 끝페이지
		int realEnd = (int) Math.ceil((double)total / cri.getAmount());
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
}