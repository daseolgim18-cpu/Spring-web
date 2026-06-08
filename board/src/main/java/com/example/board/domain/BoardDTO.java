package com.example.board.domain;

import java.time.LocalDateTime;

public class BoardDTO {
    private int bno;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime regdate;
    
    public int getBno() {
        return bno;
    }
    public void setBno(int bno) {
        this.bno = bno;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public String getWriter() {
        return writer;
    }
    public void setWriter(String writer) {
        this.writer = writer;
    }
    public LocalDateTime getRegdate() {
        return regdate;
    }
    public void setRegdate(LocalDateTime regdate) {
        this.regdate = regdate;
    }

    
}
