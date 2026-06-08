package com.example.board.controller;

import com.example.board.domain.BoardDTO;
import com.example.board.repository.BoardRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
    
    private final BoardRepository boardRepository;

    public BoardController(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    @GetMapping("/board")
    public String mainPage(Model model) {
        model.addAttribute("boardList", boardRepository.selectAll());
        model.addAttribute("pageTitle", "NCS 데이터베이스 연동 게시판 시스템");
        return "board";
    }
    

    @PostMapping("/board/write")
    public String writePost(@RequestParam("title") String title,
                            @RequestParam("content") String content,
                            @RequestParam("writer") String writer) {
        
        BoardDTO board = new BoardDTO();
        board.setTitle(title.strip());
        board.setContent(content.strip());
        board.setWriter(writer.strip());

        boardRepository.insert(board);
        return "redirect:/board";
    }

    @PostMapping("/board/delete")
    public String deletePost(@RequestParam("bno") int bno) {
        boardRepository.delete(bno);
        
        return "redirect:/board";
    }   
}
