package com.example.beans;

import java.sql.Date;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotBlank;

import com.example.entities.Categories;

public class ProductModel {
	private int id;
	@Size(min = 2 , max = 10)
	private String name;
	private int price;
	private String image;
	private Date createdDate;
	private int available;
	private Categories categoryId;
	public ProductModel() {
		
	}
	public ProductModel(int id ,String name , String image , int available , Categories categoryId , int price , Date createdDate) {
		this.id= id;
		this.name = name;
		this.image = image;
		this.available = available;
		this.categoryId = categoryId;
		this.price = price;
		this.createdDate = createdDate;

	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public int getAvailable() {
		return available;
	}
	public void setAvailable(int available) {
		this.available = available;
	}
	public Categories getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Categories categoryId) {
		this.categoryId = categoryId;
	}
	
}
