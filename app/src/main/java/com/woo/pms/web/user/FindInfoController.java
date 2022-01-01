package com.woo.pms.web.user;

import javax.servlet.ServletContext;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.woo.pms.dao.UserDao;
import com.woo.pms.domain.User;

@Controller
public class FindInfoController {

  @Autowired UserDao userDao;
  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired ServletContext sc;

  @GetMapping("/user/findemail/form")
  public ModelAndView findEmailForm() throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("pageTitle", "내 정보 찾기");
    mv.addObject("contentUrl", "member/FindEmailForm.jsp");
    mv.setViewName("template1");
    return mv;
  }

  @PostMapping("/user/findemail")
  public ModelAndView findEmail(String tel, String name) throws Exception {
    ModelAndView mv = new ModelAndView();

    User userInfo = userDao.findEmailByNameAndTel(name, tel);

    if (userInfo != null) {
      String email = 
          userInfo.getEmail().replace(
              userInfo.getEmail().substring(
                  userInfo.getEmail().lastIndexOf("@"), userInfo.getEmail().length()),
              "*****");
      mv.addObject("email", email);
      mv.addObject("user", userInfo);
      mv.addObject("contentUrl", "member/FindEmail.jsp");
      mv.setViewName("template1");

    } else {
      mv.addObject("pageTitle", "⚠정보 오류");
      mv.addObject("refresh", "2;url=findemailform");
      mv.addObject("contentUrl", "user/InputFail.jsp");
      mv.setViewName("template1");      
    }
    return mv;
  }
  //test


}
