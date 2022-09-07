package com.example.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.beans.CategoryModel;
import com.example.entities.Categories;
import com.example.repositories.CategoryRepository;
@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	@Autowired
	private CategoryRepository categoryRepo;
	@GetMapping("/create")
	public String create(@ModelAttribute("category") Categories cate )
	{
		return "admin/category/create";
	
	}
	@PostMapping("/store")
	public String store(@Valid @ModelAttribute("category") CategoryModel category , BindingResult result)
	{
		if(result.hasErrors()) {
			return "admin/category/create";
		}else {
			Categories cate = new Categories();
			cate.setId(category.getId());
			cate.setName(category.getName());
		
		this.categoryRepo.save(cate);
		return "redirect:/admin/category/index";
		}
	}
	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id")  Categories cate , Model model)
	{
		model.addAttribute("cate",cate);
		return "admin/category/edit";
	
	}
	@PostMapping("/update/{id}")
	public String update(@PathVariable("id") Categories cate , CategoryModel cateModel)
	{

		cate.setName(cateModel.getName());
		this.categoryRepo.save(cate);
		return "redirect:/admin/category/index";
	}
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Categories category)
	{
		this.categoryRepo.delete(category);
		return "redirect:/admin/category/index";
	}
	@GetMapping("index")
	public String index(		
			Model model,
			@RequestParam(name="size", defaultValue="1") Integer size,
			@RequestParam(name="page", defaultValue="0") Integer page
		) {
			PageRequest pageable = PageRequest.of(page, size);
			Page<Categories> p = this.categoryRepo.findAll(pageable);
			model.addAttribute("data", p);
			return "admin/category/index";
		}
}
