package com.example.ToDoApp.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.ToDoApp.entity.ToDodata;
import com.example.ToDoApp.service.ToDodataService;

import java.util.Collections;
import java.util.List;

import org.springframework.http.HttpStatus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private ToDodataService toDodataService;

    @ModelAttribute("toDo")
    public ToDodata toDodata() {
        return new ToDodata();
    }

    @GetMapping
    public String home(Model model) {
        try {
            Iterable<ToDodata> toDos = toDodataService.getAllToDos();
            model.addAttribute("toDos", toDos);
        } catch (Exception e) {
            e.printStackTrace();
            // Log the exception using a logger
            // Handle the exception appropriately
        }
        return "toDosdata";
    }

    
    @GetMapping("/toDos")
    public String getAllToDosJson(Model model) {
    	return "toDosdata";


}
    @GetMapping("/alltoDos")
    @ResponseBody
    public   List<ToDodata>  getAllToDosJson() {
    	
        try {
            // Return the list of all toDos as JSON
        	  // Get the updated list of all toDos from the service (including the newly saved one)
            List<ToDodata> allToDos = (List<ToDodata>) toDodataService.getAllToDos();
           System.out.println(allToDos);
           return  allToDos;
            
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
           
}
}
}

