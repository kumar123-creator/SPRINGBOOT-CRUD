package com.example.ToDoApp.service.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.ToDoApp.entity.ToDodata;
import com.example.ToDoApp.repo.ToDodataRepo;
import com.example.ToDoApp.service.ToDodataService;

@Service
public class ToDodataServiceImpl implements ToDodataService {

    @Autowired
    private ToDodataRepo toDodataRepo;

    @Override
    public Iterable<ToDodata> getAllToDos() {
        try {
            return toDodataRepo.findAll();
        } catch (Exception e) {
            e.printStackTrace();
            // Log the exception using a logger
            // Handle the exception appropriately
            return null; // or throw a custom exception
        }
    }

    @Override
    public ToDodata saveToDo(ToDodata toDodata) {
        try {
            return toDodataRepo.save(toDodata);
        } catch (Exception e) {
            e.printStackTrace();
            // Log the exception using a logger
            // Handle the exception appropriately
            return null; // or throw a custom exception
        }
    }
    @Override
    public void deleteToDoById(int id) {
        // Implementation to delete a toDo by ID
        toDodataRepo.deleteById(id);
    }

    @Override
    public ToDodata addToDo(ToDodata toDodata) {
        // Implement the logic to add a toDo, e.g., validation, business logic, etc.
        // You can return the saved toDo data if needed
        return toDodataRepo.save(toDodata);
   
    }

    @Override
    public ToDodata updateToDo(ToDodata updatedToDo) {
        // Check if the toDo with the given ID exists
        Optional<ToDodata> existingToDoOptional = toDodataRepo.findById(updatedToDo.getId());

        if (existingToDoOptional.isPresent()) {
            // If the toDo exists, update the data
            ToDodata existingToDo = existingToDoOptional.get();
            existingToDo.setTitle(updatedToDo.getTitle());
            existingToDo.setAuthor(updatedToDo.getAuthor());
            existingToDo.setMobile(updatedToDo.getMobile());

            // Save the updated student
            return toDodataRepo.save(existingToDo);
        } else {
            // Handle the case where the student with the given ID does not exist
            // You may throw an exception or return null, depending on your requirements
            return null;
        }
    }
}
