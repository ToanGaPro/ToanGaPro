package com.example.beans;

import java.sql.Date;

import org.hibernate.validator.constraints.NotBlank;

import com.example.entities.Accounts;

public class OrderModel {
	private int id;
	private Accounts userId;
	@NotBlank(message = "Can't be left blank")
	private String address;
	private Date createdDate;
	public OrderModel() {
		
	}
	public OrderModel(int id ,String address , Accounts userId , Date createdDate) {
		this.id = id;
		this.address = address;
		this.userId = userId;
		this.createdDate = createdDate;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Accounts getUserId() {
		return userId;
	}
	public void setUserId(Accounts userId) {
		this.userId = userId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
}
