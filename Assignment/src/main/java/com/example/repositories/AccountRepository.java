package com.example.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.jpa.repository.Query;
//import org.springframework.data.repository.query.Param;
import org.springframework.data.repository.query.Param;

import com.example.entities.Accounts;

public interface AccountRepository extends JpaRepository<Accounts, Integer> {
	@Query(name="Accounts.findByEmail")
	public Accounts findByEmail(@Param("email") String email);
	
//	@Query(value = "SELECT acc FROM accounts acc WHERE acc.id = :id") 
	@Query(name="Accounts.findById")
	public Accounts findById(@Param("id") int id);
	
}
