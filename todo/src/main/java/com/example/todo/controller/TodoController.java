package com.example.todo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;


@Controller
public class TodoController {
    
    // 실슴용 인메모리 ToDo 리스트 (Controller는 라이브러리 함수 생성자 안됨)
    private final List<String> todoList = new ArrayList<>(List.of("스프링 부트 4.0 환경 설정하기", "MVC 모델 구조 이해하기"));

    @GetMapping("/todo")
    public String getTodoList(Model model) {
        model.addAttribute("todos", todoList);
        model.addAttribute("pageTitle", "ToDo 리스트 관리 시스템");
        return "todo"; // /WEB-INF/views/todo.jsp 로 연결
    }

    @PostMapping("/todo/add")
    public String addTodo(@RequestParam("task") String task) {
        if (task != null&& !task.strip().isEmpty()){
            todoList.add(task.strip());
        }
        
        return "redirect:/todo"; // 등록 후 리스트로 리다이렉트 
    }

    @PostMapping("/todo/delete")
    public String deleteTodo(@RequestParam("index") int index) {
        // 인덱스 범위를 벗어나지 않는지 검증 후 삭제
        if (index >= 0 && index < todoList.size()){
            todoList.remove(index);
        }
        
        return "redirect:/todo"; 
    }
    
    
}
