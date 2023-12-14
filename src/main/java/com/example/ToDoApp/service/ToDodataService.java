package com.example.ToDoApp.service;

import com.example.ToDoApp.entity.ToDodata;


public interface ToDodataService {

    Iterable<ToDodata> getAllToDos();

    ToDodata saveToDo(ToDodata toDodata);

    void deleteToDoById(int id);

  
    // New method for adding a student
    ToDodata addToDo(ToDodata toDodata);

    ToDodata updateToDo(ToDodata updatedToDo);
}