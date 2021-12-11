package com.woo.pms.web.user;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import com.woo.pms.dao.UserDao;

@Controller
public class FindInfoController {

  @Autowired UserDao userDao;
  @Autowired SqlSessionFactory sqlSessionFactory;

  @GetMapping("/find/email/form")
  public ModelAndView findEmailForm() throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", "내 정보 찾기");
    mv.addObject("contentUrl", "member/FindEmailForm.jsp");
    mv.setViewName("template1");
    return mv;
  }

}
