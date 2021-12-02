package com.woo.pms.web.user;

import javax.servlet.ServletContext;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.woo.pms.dao.UserDao;

@RestController
@Controller
public class UserController {

  @Autowired UserDao userDao;
  @Autowired ServletContext sc;
  @Autowired SqlSessionFactory sqlSessionFactory;

  @GetMapping("/user/form")
  public ModelAndView form() {
    ModelAndView mv = new ModelAndView();

    mv.setViewName("UserForm");
    return mv;
  }

}
