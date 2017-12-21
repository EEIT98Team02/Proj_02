package _01_member.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import _01_member.model.MemberBean;
import _01_member.model.MemberService;

@Controller
@RequestMapping(path = { "login.controller" })
@SessionAttributes(names= {"member"})
public class LoginController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(method = { RequestMethod.POST })
	public String login(String memberemail, String memberpassword, Model model) {

		Map<String, String> errors = new HashMap<>();
		model.addAttribute("errors", errors);

		if (memberemail == null || memberemail.trim().length() == 0) {
			errors.put("erremail", "請輸入帳號");
		}
		if (memberpassword == null || memberpassword.trim().length() == 0) {
			errors.put("errpsw", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {
			return "login.error";
		}
		
		MemberBean bean=memberService.login(memberemail, memberpassword);
		
		if(bean==null) {
			errors.put("errpsw", "登入失敗");
			return "login.error";
		} else {
			model.addAttribute("member", bean);
			System.out.println(bean);
		}
		
	return "login.success";
	}
}