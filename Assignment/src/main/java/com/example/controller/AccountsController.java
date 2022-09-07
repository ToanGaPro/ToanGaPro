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

import com.example.beans.AccountModel;
import com.example.entities.Accounts;
import com.example.repositories.AccountRepository;
import com.example.utils.EncryptUtil;

@Controller
@RequestMapping("/admin/accounts")
public class AccountsController {
	@Autowired
	private AccountRepository accountRepo;
	@GetMapping("create")
	public String create(@ModelAttribute("account") AccountModel account)
	{
		return "admin/accounts/create";
	
	}
	@PostMapping("store")
	public String store(@Valid @ModelAttribute("account") AccountModel account , BindingResult result)
	{
		if(result.hasErrors()) {
			return "admin/accounts/create";
		}else {
			Accounts acc = new Accounts();
			acc.setFullname(account.getFullname());
			acc.setUsername(account.getUsername());
			acc.setEmail(account.getEmail());
			acc.setPhoto(account.getPhoto());
			String encrypted = EncryptUtil.encrypt("password");
			acc.setPassword(encrypted);
			acc.setAdmin(account.getAdmin());
			acc.setActivated(0);
			this.accountRepo.save(acc);
			return "redirect:/admin/accounts/index";
		}
	}
	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") Accounts acc ,Model model)
	{
		model.addAttribute("acc", acc);
		return "admin/accounts/edit";
	
	}
	@PostMapping("/update/{id}")
	public String update(@PathVariable("id") Accounts accModel , AccountModel a)
	{
		Accounts accA = new Accounts();
		accA.setId(accModel.getId());
		accA.setPassword(accModel.getPassword());
		accA.setFullname(a.getFullname());
		accA.setUsername(a.getUsername());
		accA.setEmail(a.getEmail());
		accA.setPhoto(a.getPhoto());
		this.accountRepo.save(accA);
		return "redirect:/admin/accounts/index";
	}
	@GetMapping("delete/{id}")
	public String delete(@PathVariable("id") Accounts account)
	{
		this.accountRepo.delete(account);
		return "redirect:/admin/accounts/index";
	}
	@GetMapping("index")
	public String index(		
			Model model,
			@RequestParam(name="size", defaultValue="1") Integer size,
			@RequestParam(name="page", defaultValue="0") Integer page
		) {
			PageRequest pageable = PageRequest.of(page, size);
			Page<Accounts> p = this.accountRepo.findAll(pageable);
			model.addAttribute("data", p);
			return "admin/accounts/index";
		}
}
