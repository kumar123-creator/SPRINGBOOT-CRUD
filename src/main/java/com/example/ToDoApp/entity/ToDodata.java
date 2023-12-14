package com.example.ToDoApp.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;



@Entity
@Table(name = "toDodata")
public class ToDodata {

	 
	    @Id
	    private int id;

	    private String title;
	    private String author;
	    private String mobile;

	    // Constructors, getters, setters

	    // Constructors
	    public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getAuthor() {
			return author;
		}

		public void setAuthor(String author) {
			this.author = author;
		}

		public String getMobile() {
			return mobile;
		}

		public void setMobile(String mobile) {
			this.mobile = mobile;
		}

		public ToDodata() {
	    }

	    public ToDodata(String title , String author, String mobile) {
	        this.title = title;
	        this.author = author;
	        this.mobile = mobile;
	    }

	   
}
