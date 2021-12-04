package com.woo.pms.web.auth;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.woo.pms.dao.UserDao;
import com.woo.pms.domain.User;

@Controller
public class AuthController {

  @Autowired UserDao userDao;
  @Autowired SqlSessionFactory sqlSessionFactory;

  @GetMapping("/auth/form")
  public ModelAndView loginFrom() {
    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", " login ");
    mv.addObject("contentUrl", "auth/LoginForm.jsp");
    mv.setViewName("template1");

    return mv;    
  }

  @PostMapping("/auth/login")
  public ModelAndView perLogin(String email, String password, String saveEmail, HttpServletResponse response, HttpSession session) throws Exception {
    Cookie cookie = null;

    if (saveEmail != null) {
      cookie = new Cookie("email", email);
      cookie.setMaxAge(60 * 60 * 24 * 7);

    } else {
      cookie = new Cookie("email", "");
      cookie.setMaxAge(0);        // 유효기간을 0으로 설정, 웹브라우저가 받는 즉시 무효한 쿠키가 된다
    }

    response.addCookie(cookie);

    User user = userDao.findByEmailAndPassword(email, password);

    ModelAndView mv = new ModelAndView();

    if (user != null) {
      session.setAttribute("loginUser", user);
      mv.setViewName("redirect:../index");

    } else {
      mv.addObject("pageTitle", "⚠error");
      mv.addObject("refresh", "2;url=form");
      mv.addObject("contentUrl", "LoginFail.jsp");
      mv.setViewName("template1");
    }
    return mv;
  } 

  @GetMapping("/auth/logout")
  public ModelAndView perLogout(HttpSession session) throws Exception {

    session.invalidate();
    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../index");
    return mv;
  }  

}
