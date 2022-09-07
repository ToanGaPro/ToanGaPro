package com.example.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.entities.Categories;



public interface CategoryRepository extends JpaRepository<Categories, Integer>{
//	@Query(value = "SELECT acc FROM categories acc WHERE acc.id = :id") 
//	@Query(name="Categories.findById")
//	public Categories findById(@Param("id")  int id);
}
