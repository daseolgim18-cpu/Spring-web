package com.example.todo;

public class Todo {
    private final Long id;
    private final String content;

    public Todo(Long id, String content){
        this.id = id;
        this.content = content;
    }

    public Long id() { return this.id; }
    public String content() { return this.content;}
}
