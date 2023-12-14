package com.example.ToDoApp.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.ToDoApp.entity.ToDodata;

@Repository
public interface ToDodataRepo extends JpaRepository<ToDodata, Integer>{
	
}