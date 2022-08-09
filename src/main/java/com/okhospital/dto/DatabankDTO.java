package com.okhospital.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class DatabankDTO {
    private int datano;
    private String dtitle;
    private String dcontent;
    private String dposter;
    private String dfilename;
    private char dview;
    private String regdate;
    
    //입력 폼에서 <input type='file' name='postMF'>
    private MultipartFile posterMF;
    //입력 폼에서 <input type='file' name='filenameMF'>
    private MultipartFile filenameMF;
    
	public int getDatano() {
		return datano;
	}
	public void setDatano(int datano) {
		this.datano = datano;
	}
	public String getDtitle() {
		return dtitle;
	}
	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}
	public String getDcontent() {
		return dcontent;
	}
	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}
	public String getDposter() {
		return dposter;
	}
	public void setDposter(String dposter) {
		this.dposter = dposter;
	}
	public String getDfilename() {
		return dfilename;
	}
	public void setDfilename(String dfilename) {
		this.dfilename = dfilename;
	}
	public char getDview() {
		return dview;
	}
	public void setDview(char dview) {
		this.dview = dview;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	public MultipartFile getPosterMF() {
		return posterMF;
	}
	public void setPosterMF(MultipartFile posterMF) {
		this.posterMF = posterMF;
	}
	public MultipartFile getFilenameMF() {
		return filenameMF;
	}
	public void setFilenameMF(MultipartFile filenameMF) {
		this.filenameMF = filenameMF;
	}

	
}