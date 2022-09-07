package com.example.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entities.Products;

public interface ProductRepository extends JpaRepository<Products, Integer> {

}
