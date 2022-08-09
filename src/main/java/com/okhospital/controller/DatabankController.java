package com.okhospital.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.okhospital.dto.DatabankDTO;
import com.okhospital.service.DatabankService;
import com.okhospital.util.MediaUtils;
import com.okhospital.util.UploadFileUtils;

@Controller
@RequestMapping("/databank/*")
public class DatabankController {
	private static final Logger logger = LoggerFactory.getLogger(DatabankController.class);
	
	@Autowired
	DatabankService databankService;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping("list.do")
	public String databankList(Model model) throws Exception {
		List<DatabankDTO> databankList = databankService.databankList();
		model.addAttribute("databankList", databankList);
		return "databank/databankList";
	}

	@RequestMapping(value="read.do", method = RequestMethod.GET)
	public String databankRead(@RequestParam int datano, Model model) throws Exception {
		DatabankDTO databank = databankService.databankRead(datano);
		/*
		 * String filename = databank.getDfilename(); filename =
		 * filename.substring(filename.lastIndexOf("/")+1, filename.length());
		 * databank.setDfilename(filename);
		 */
		model.addAttribute("databank", databank);
		return "databank/databankRead";
	}

	@RequestMapping("writeForm.do")  
	public String databankWriteForm(DatabankDTO ddto, Model model) throws Exception {
		return "databank/databankWriteForm";
	}
	
	@RequestMapping(value="insert.do", method = RequestMethod.POST)
	public String databankWrite(DatabankDTO ddto) throws Exception {		
		databankService.databankWrite(ddto);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="update.do", method = RequestMethod.POST)
	public String databankUpdate(DatabankDTO ddto, Model model) throws Exception {
		databankService.databankUpdate(ddto);
		return "redirect:list.do";
	}

	@RequestMapping(value="delete.do", method = RequestMethod.GET)
	public String databankDelete(@RequestParam int datano, Model model) throws Exception {
		databankService.databankDelete(datano);
		return "redirect:list.do";
	}
	/* 여기 까지 자료실 */
	
	
	
	
	/* 여기부터는 파일 업로드 */
	//Get 방식으로 업로드 폼 열기
	@RequestMapping(value = "uploadForm.do", method = RequestMethod.GET)
	public String uploadFormGET() {
		return "databank/uploadForm";
	}
	
	//Post 방식으로 업로드 폼 열기
	@RequestMapping("uploadForm.do")  
	public String uploadFormPOST(MultipartFile file, Model model) throws Exception {
		logger.info("uploadFormPost");
		if(file != null) {
			logger.info("originalName:" + file.getOriginalFilename());
			logger.info("size:" + file.getSize());
			logger.info("ContentType:" + file.getContentType());
		}
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName", savedName);
		model.addAttribute("uploadFile", savedName);
		return "databank/uploadForm";
	}
	
	//업로드된 파일 저장 함수
	private String uploadFile(String originalName, byte[] fileDate) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileDate, target);		
		return savedName;
	}
	
	
	//Ajax 파일 업로드
	@RequestMapping(value="uploadAjax.do", method = RequestMethod.GET)
	public String uploadAjaxGET() {
		return "databank/uploadAjax";
	}
	
	//Ajax로 한글 파일이름이나 데이터를 받아서 처리
	@ResponseBody
	@RequestMapping(value="uploadAjax.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadAjaxPOST(MultipartFile file, Model model) throws Exception {
		logger.info("originalName:" + file.getOriginalFilename());
		logger.info("size:" + file.getSize());
		logger.info("contentType:" + file.getContentType());
		model.addAttribute("uploadFile", file.getOriginalFilename());
		return new ResponseEntity<>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	
	//화면에 저장된 파일을 보여주는 컨트롤러 /년/월/일/파일명 형태
	@ResponseBody
	@RequestMapping(value="displayFile.do", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;		
		logger.info("File name: " + fileName);
		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);			
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(uploadPath + fileName);		
			if(mType != null) {
				headers.setContentType(mType);
			}else {
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteFile.do", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName) throws Exception {
		logger.info("delete file:" + fileName);		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);		
		if(mType != null) {
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath + (front+end).replace('/', File.separatorChar)).delete();
		}//if
		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();	
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
