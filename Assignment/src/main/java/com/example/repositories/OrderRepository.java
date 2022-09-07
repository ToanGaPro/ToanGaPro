package com.example.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.entities.Orders;

public interface OrderRepository extends JpaRepository<Orders, Integer> {
	@Query(value = "SELECT Max(acc.id) FROM Orders acc ") 
	public int finMaxIdOrder();
}
