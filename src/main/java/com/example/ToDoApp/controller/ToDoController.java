package com.example.ToDoApp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.ToDoApp.entity.ToDodata;
import com.example.ToDoApp.service.ToDodataService;


@Controller
public class ToDoController {

    @Autowired
    private ToDodataService toDodataService;
	@PostMapping("/addtoDo")
	@ResponseBody
	public ToDodata addToDo(@RequestBody ToDodata toDodata) {
	    try {
	        // Save the toDodata object using the service
	        return toDodataService.saveToDo(toDodata);
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Log the exception using a logger
	        // Handle the exception appropriately, e.g., return null or an error message
	        return null;
	    }
	}

	@PostMapping("/deleteToDo/{id}")
	public String deleteToDo(@PathVariable int id, Model model) {
	    try {
	        // Delete the toDo by ID
	        toDodataService.deleteToDoById(id);

	        // Get the updated list of all toDos
	        List<ToDodata> allToDos = (List<ToDodata>) toDodataService.getAllToDos();

	        // Add the updated list of toDos to the model for the "toDosdata.jsp" page
	        model.addAttribute("toDos", allToDos);
	        System.out.println(allToDos);
	    } catch (Exception e) {
	        e.printStackTrace();
	        // Log the exception using a logger
	        // Handle the exception appropriately, e.g., display an error message
	    }

	    return "studentsdata";
	}

    @PostMapping("/updateToDo/{id}")
    @ResponseBody
    public ResponseEntity<?> updateToDo(@PathVariable int id, @RequestBody ToDodata updatedToDo) {
        try {
            // Set the ID of the updated toDo
            updatedToDo.setId(id);

            // Update the toDo data using the service
            toDodataService.updateToDo(updatedToDo);

            // Get the updated list of all students
            List<ToDodata> allToDos = (List<ToDodata>) toDodataService.getAllToDos();

            return ResponseEntity.ok(allToDos); // Return the updated list of students

        } catch (Exception e) {
            e.printStackTrace();
            // Log the exception using a logger
            // Handle the exception appropriately, e.g., return an error response
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error updating toDo: " + e.getMessage());
        }
    }
}