package com.example.controller;






import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.beans.AccountModel;
import com.example.entities.Accounts;
import com.example.repositories.AccountRepository;
import com.example.utils.EncryptUtil;

@Controller
@RequestMapping("/admin/logins")
public class LoginController {
	@Autowired
	AccountRepository accrepo;
	@Autowired
	HttpServletRequest request;
	@GetMapping("/login")
	public String login(@ModelAttribute("account") AccountModel acc) {
		return "/admin/logins/login";
	}
	@PostMapping("/store")
	public String store(@ModelAttribute("account") AccountModel acc) {
		HttpSession session = request.getSession();
		Accounts ac = this.accrepo.findByEmail(acc.getEmail());
		if(ac == null) {
			session.setAttribute("error", "Email không chính xác");
			return "redirect:/admin/logins/login";
		}
//		boolean check = EncryptUtil.check(acc.getPassword(), ac.getPassword());
//		if(check == true) {
//			session.setAttribute("ac", ac);
//			return "redirect:/admin/layout";
//		}else {
//			session.setAttribute("error", "Mật khẩu không chính xác");
////			return "redirect:/admin/logins/login";
		return "redirect:/admin/shoppingcart/index";
		}
}

