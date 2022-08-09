package com.okhospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;

import com.okhospital.dto.BoardDTO;
import com.okhospital.dto.PageDTO;
import com.okhospital.service.BoardService;
import com.okhospital.util.Criteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	//private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	//다음 서비스 작업 객체를 주입
	@Autowired
	BoardService boardService;
	
	@RequestMapping("list.do")
	public String boardList(Model model) throws Exception {
		// board 테이블에서 전체글 리스트로 가져오기	
		List<BoardDTO> boardList = boardService.boardList();
		model.addAttribute("boardList", boardList);
		return "board/boardList";
	}
	
	@RequestMapping(value="list2.do", method = RequestMethod.GET)
	public String boardList2(Criteria cri, Model model) throws Exception {
		int totalCount = boardService.getTotalCount(); // 전체글개수 가져오기
		
		// board 테이블에서 전체글 리스트로 가져오기
		if(totalCount<10) {
			cri.setEnd(totalCount);
		}
		List<BoardDTO> boardList = boardService.boardList2(cri);
		
		PageDTO pageDTO = new PageDTO(cri, totalCount);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", pageDTO);
		
		return "board/boardList2";
	}

// 구형 ModelAndView 방식
//	public ModelAndView boardList() throws Exception {
//		List<BoardDTO> boardList = boardService.boardList();
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("board/boardList");
//		mav.addObject("boardList", boardList);
//		return mav;
//	}
	
	@RequestMapping(value="read.do", method = RequestMethod.GET)
	public String boardRead(@RequestParam int seq, Model model) throws Exception {
		BoardDTO board = boardService.boardRead(seq);
		model.addAttribute("board", board);
		return "board/boardRead";
	}

	@RequestMapping(value="read2.do", method = RequestMethod.GET)
	public String boardRead2(@RequestParam int seq, Model model) throws Exception {
		BoardDTO board = boardService.boardRead(seq);
		model.addAttribute("board", board);
		return "board/boardRead2";
	}
	
	@RequestMapping("write_form.do")  //board/write_form  -> board/boardWriteForm.jsp
	public String boardWriteForm(Model model) throws Exception {
		return "board/boardWriteForm";
	}
	
	@RequestMapping(value="insert.do", method = RequestMethod.POST)
	public String boardWrite(BoardDTO bdto, Model model) throws Exception {
		boardService.boardWrite(bdto);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="update.do", method = RequestMethod.POST)
	public String boardUpdate(BoardDTO bdto, Model model) throws Exception {
		boardService.boardUpdate(bdto);
		return "redirect:list.do";
	}

	@RequestMapping(value="delete.do", method = RequestMethod.GET)
	public String boardDelete(@RequestParam int seq, Model model) throws Exception {
		boardService.boardDelete(seq);
		return "redirect:list.do";
	}
}