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

import com.example.beans.OrderModel;
import com.example.entities.Accounts;
import com.example.entities.Orders;
import com.example.repositories.AccountRepository;
import com.example.repositories.OrderRepository;

@Controller
@RequestMapping("/admin/orders")
public class OrderController {
	@Autowired
	private OrderRepository oderRepo;
	@Autowired
	private AccountRepository accRepo;
	@GetMapping("create")
	public String create (@ModelAttribute("orders")
			OrderModel ormodel, Model model
			) {
		List<Accounts> listacc = this.accRepo.findAll();
		model.addAttribute("listacc", listacc);
				return "admin/orders/create";
		
	}
	@PostMapping("store")
	public String store(Model model ,@Valid @ModelAttribute("orders") OrderModel orders  , BindingResult result) {
		if(result.hasErrors()) {
			List<Accounts> listacc = this.accRepo.findAll();
			model.addAttribute("listacc", listacc);
			return "admin/orders/create";
		}else {
			Orders order = new Orders();
			order.setUserId(order.getUserId());
			order.setCreatedDate(orders.getCreatedDate());
			order.setAddress(orders.getAddress());
			this.oderRepo.save(order);
			return "redirect:/admin/orders/index";
		}
	}
	@GetMapping("edit/{id}")
	public String edit(
			@PathVariable("id") Orders order,
			Model model
			) {
		List<Accounts> listacc = this.accRepo.findAll();
		model.addAttribute("listacc", listacc);
		model.addAttribute("orders",order);
		return "admin/orders/edit";
	}
	@PostMapping("/update/{id}")
	public String update(
			@PathVariable("id") Orders order,
			OrderModel ordermodel
			) {
		order.setUserId(ordermodel.getUserId());
		order.setCreatedDate(ordermodel.getCreatedDate());
		order.setAddress(ordermodel.getAddress());
		this.oderRepo.save(order);
		return "redirect:/admin/orders/index";
	}
	@GetMapping("delete/{id}")
	public String delete(
			@PathVariable("id") Orders order
			) {
		this.oderRepo.delete(order);
		return "redirect:/admin/orders/index";
	}
	@GetMapping("index")
	public String index(
		Model model,
		@RequestParam(name="size", defaultValue="1") Integer size,
		@RequestParam(name="page", defaultValue="0") Integer page
	) {
		PageRequest pageable = PageRequest.of(page, size);
		Page<Orders> p = this.oderRepo.findAll(pageable);
		model.addAttribute("data", p);
		return "admin/orders/index";
	}
	
	
}
