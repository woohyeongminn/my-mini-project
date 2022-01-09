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
import com.woo.pms.util.RandomPw;
import com.woo.pms.util.SendMail;

@Controller
public class FindInfoController {

  @Autowired UserDao userDao;
  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired ServletContext sc;

  @GetMapping("/user/findemailform")
  public ModelAndView findEmailForm() throws Exception {

    ModelAndView mv = new ModelAndView();

    mv.addObject("contentUrl", "user/FindEmailForm.jsp");
    mv.setViewName("template1");
    return mv;
  }

  @PostMapping("/user/findemail")
  public ModelAndView findEmail(String tel, String name) throws Exception {
    ModelAndView mv = new ModelAndView();

    User userInfo = userDao.findEmailByNameAndTel(name, tel);
    System.out.println(userInfo);

    if (userInfo != null) {
      String email = 
          userInfo.getEmail().replace(
              userInfo.getEmail().substring(
                  userInfo.getEmail().lastIndexOf("@"), userInfo.getEmail().length()),
              "*****");
      mv.addObject("email", email);
      mv.addObject("user", userInfo);
      mv.addObject("contentUrl", "user/FindEmail.jsp");
      mv.setViewName("template1");

    } else {
      mv.addObject("refresh", "2;url=findemailform");
      mv.addObject("contentUrl", "Noinfo.jsp");
      mv.setViewName("template1");
      return mv;    
    }
    return mv;
  }
  //test

  @GetMapping("/user/getpwform")
  public ModelAndView getPasswordForm() throws Exception {
    ModelAndView mv = new ModelAndView();

    mv.addObject("contentUrl", "user/GetPwForm.jsp");
    mv.setViewName("template1");
    return mv;
  }


  @PostMapping("/user/getpw")
  public ModelAndView getPassword(String name, String email) throws Exception {
    ModelAndView mv = new ModelAndView();
    SendMail sendMail = new SendMail();
    RandomPw randomPw = new RandomPw();

    User user  = userDao.findByNameAndEmail(name, email);

    if (user != null) {
      String pw = randomPw.randomPw();
      user.setPassword(pw);
      sendMail.sendMail(email, pw);
      userDao.updatePassword(user);
      sqlSessionFactory.openSession().commit();

      mv.addObject("user", user);
      mv.addObject("contentUrl", "user/GetPw.jsp");
      mv.setViewName("template1");
    } else {
      mv.addObject("refresh", "2;url=getpwform");
      mv.addObject("contentUrl", "Noinfo.jsp");
      mv.setViewName("template1");

    }
    return mv;
  }
}


