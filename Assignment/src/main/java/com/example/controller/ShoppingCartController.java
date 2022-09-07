package com.example.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.beans.OrderDetailModel;
import com.example.beans.OrderModel;
import com.example.entities.OrderDetails;
import com.example.entities.Products;
import com.example.entities.Accounts;
import com.example.entities.Orders;
import com.example.repositories.AccountRepository;
import com.example.repositories.OrderDetailRepository;
import com.example.repositories.OrderRepository;
import com.example.repositories.ProductRepository;

@Controller
@RequestMapping("/admin/shoppingcart")
public class ShoppingCartController {
	@Autowired
	private AccountRepository accountRepo;
	
	@Autowired
	private ProductRepository productRepo;
	
	@Autowired
	private OrderDetailRepository orderdetailRepo;
	
	@Autowired
	private OrderRepository oderRepo;
	
	@GetMapping("index")
	public String index(
		Model model,
		@RequestParam (name="size", defaultValue = "6") Integer size,
		@RequestParam (name="page", defaultValue = "0") Integer page,
		@ModelAttribute("oderdetail") OrderDetailModel oderdetail
			) {
		
		PageRequest pageable = PageRequest.of(page, size);
		Page<Products> p = this.productRepo.findAll(pageable);
		model.addAttribute("data",p);
		return "admin/shoppingcart/home";
	}
	
	@PostMapping("/store/{id}")
	public String store(
		@PathVariable("id") Products product,
		OrderDetailModel oderdetail
	) 
	{		
		OrderDetails  check =this.orderdetailRepo.findbyOderIdandProid(0, product.getId());
		if(check == null) {
			OrderDetails order = new OrderDetails();
			order.setPrice(product.getPrice()*oderdetail.getQuantity());
			order.setQuantity(oderdetail.getQuantity());
			order.setProduct(product);
			order.setOrderId(0);
			this.orderdetailRepo.save(order);
		}else {
			OrderDetails od = new OrderDetails();
			od.setPrice(product.getPrice()*oderdetail.getQuantity());
			od.setQuantity(check.getQuantity() + oderdetail.getQuantity());
			od.setProduct(product);
			od.setOrderId(0);
			od.setId(check.getId());
			this.orderdetailRepo.save(od);
		}
		return "redirect:/admin/shoppingcart/index";
	}
	
	@GetMapping("buy")
	public String buy(
			Model model,
			@ModelAttribute("oder") OrderModel oder
			) {
		
		List<OrderDetails> lod=this.orderdetailRepo.finODetailbyOderId(0);
		if(lod.size()>0) {
		model.addAttribute("data",lod);
		double thanhtien =0;
		for (OrderDetails orderDetails : lod) {
			thanhtien += orderDetails.getPrice();
		}
		model.addAttribute("thanhtien",thanhtien);
		return "admin/shoppingcart/create";
		}else {
			return "redirect:/admin/shoppingcart/index";
		}
	}
	
	@PostMapping("add")
	public String add(OrderModel oder , Model model) {
		List<OrderDetails> listOrderD = this.orderdetailRepo.finODetailbyOderId(0);
		int idstr= this.oderRepo.finMaxIdOrder();
		int idadd=idstr+1;
		
		Accounts acc = this.accountRepo.findById(1);
		Orders oders = new Orders();
		oders.setAddress(oder.getAddress());
		oders.setUserId(acc);
		oders.setCreatedDate(new Date());
		for (OrderDetails orderDetails : listOrderD) {
			orderDetails.setOrderId(idadd);
			this.orderdetailRepo.save(orderDetails);
		}
		this.oderRepo.save(oders);
		return "redirect:/admin/shoppingcart/index";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") OrderDetails orderdetail)
	{
		this.orderdetailRepo.delete(orderdetail);

		return "redirect:/admin/shoppingcart/buy";
	}
}