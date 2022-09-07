package com.example.beans;

import org.hibernate.validator.constraints.NotBlank;

public class CategoryModel {
	private int id;
	@NotBlank(message = "Can't be left blank")
	private String name;
	public CategoryModel() {
		
	}
	public CategoryModel(int id , String name) {
		this.id = id;
		this.name= name;
	}
	public CategoryModel(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	
}
