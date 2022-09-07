package com.example.controller;


import java.util.List;

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

import com.example.beans.ProductModel;
import com.example.entities.Categories;
import com.example.entities.Products;
import com.example.repositories.CategoryRepository;
import com.example.repositories.ProductRepository;

@Controller
@RequestMapping("/admin/products")
public class ProductController {
	@Autowired
	private CategoryRepository cateRepo;
	@Autowired
	private ProductRepository productRepo;
	@GetMapping("/create")
	public String create(@ModelAttribute("product")					
		ProductModel promd, Model model) {
		List<Categories> listcate = this.cateRepo.findAll();
		model.addAttribute("listcate", listcate);
		return "admin/products/create";
	}
	@PostMapping("/store")
	public String store( Model model ,@Valid @ModelAttribute("product") ProductModel product , BindingResult result)
	{
		if(result.hasErrors()) {
			List<Categories> listcate = this.cateRepo.findAll();
			model.addAttribute("listcate", listcate);
			return "admin/products/create";
		}else {
			Products pro = new Products();	
			pro.setName(product.getName());
			pro.setImage(product.getImage());
			pro.setPrice(product.getPrice());
			pro.setCreatedDate(product.getCreatedDate());
			pro.setAvailable(0);
			pro.setCategoryId(product.getCategoryId());
			this.productRepo.save(pro);
			return "redirect:/admin/products/index";
		}
	}
	@GetMapping("edit/{id}")
	public String edit(
			@PathVariable("id") Products product,
			Model model
			) {
		List<Categories> listcate = this.cateRepo.findAll();
		model.addAttribute("listcate", listcate);
		model.addAttribute("product", product);
		return "admin/products/edit";
	}
	@PostMapping("/update/{id}")
	public String update(
			@PathVariable("id") Products products,
			ProductModel promodel
			) {
		Products pro = new Products();
		pro.setId(products.getId());
		pro.setName(promodel.getName());
		pro.setImage(promodel.getImage());
		pro.setPrice(promodel.getPrice());
		pro.setCreatedDate(promodel.getCreatedDate());
		pro.setCategoryId(promodel.getCategoryId());
		this.productRepo.save(pro);
		return "redirect:/admin/products/index";		
	}
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Products product) {
		
		this.productRepo.delete(product);
		
		return "redirect:/admin/products/index";
	}
	@GetMapping("index")
	public String index(
		Model model,
		@RequestParam(name="size", defaultValue="1") Integer size,
		@RequestParam(name="page", defaultValue="0") Integer page
	) {
		PageRequest pageable = PageRequest.of(page, size);
		Page<Products> p = this.productRepo.findAll(pageable);
		model.addAttribute("data", p);
		return "admin/products/index";
	}
}
