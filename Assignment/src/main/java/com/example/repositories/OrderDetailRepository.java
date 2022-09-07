package com.example.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.entities.OrderDetails;

public interface OrderDetailRepository extends JpaRepository<OrderDetails, Integer> {
	@Query(value = "SELECT acc FROM OrderDetails acc WHERE acc.orderId = :id ") 
//	@Query(name="OrderDetails.finODetailbyOderId")
	public List<OrderDetails> finODetailbyOderId(@Param("id") int id);
	
	@Query(value = "SELECT acc FROM OrderDetails acc WHERE acc.orderId = :id AND acc.product.id = :id2 ") 
	public OrderDetails findbyOderIdandProid(@Param("id") int id,@Param("id2") int id2);
}
