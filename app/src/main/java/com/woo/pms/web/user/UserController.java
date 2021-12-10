package com.woo.pms.web.user;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.woo.pms.dao.UserDao;
import com.woo.pms.domain.User;
@RestController
@Controller
public class UserController {

  @Autowired UserService userService;
  @Autowired UserDao userDao;
  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired ServletContext sc;

  @GetMapping("/user/form")
  public ModelAndView form() {
    ModelAndView mv = new ModelAndView();

    mv.addObject("contentUrl", "user/UserForm.jsp");
    mv.setViewName("template1");    

    return mv;
  }

  @PostMapping("/user/add")
  protected ModelAndView add(User user) throws Exception {
    user.setActivityState(User.ACTIVE);
    userDao.insert(user);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:../auth/form");
    return mv;
  }

  //닉네임 중복확인 처리
  @RequestMapping(value="/user/nicknameOverlap", method=RequestMethod.POST)
  public void nickOverlap(HttpServletResponse response, @RequestParam("nickname") String nick) throws IOException {
    //@RequestParam는 요청의 특정 파라미터 값을 찾아낼 때 사용하는 어노테이션
    userService.nicknameOverlap(nick,response);  //서비스에 있는 nickOverlap 호출.
  } 

  @RequestMapping("/user/detail")
  public ModelAndView detail(HttpSession session) throws Exception {
    ModelAndView mv = new ModelAndView();

    User loginUser = (User) session.getAttribute("loginUser");

    if (loginUser == null) {
      Exception error = new Exception("login error!");
      mv.addObject("error", error);
      mv.addObject("contentUrl", "error.jsp");
      mv.setViewName("template1");
      return mv;
    } 

    User user = userDao.findByNo(loginUser.getNo());

    if (user != null) {
      mv.addObject("user", user);
      mv.addObject("contentUrl", "user/UserDetail.jsp");
      mv.setViewName("template1");

    } else {
      Exception error = new Exception("번호와 일치하는 회원 없음!");
      mv.addObject("error", error);      
      mv.addObject("contentUrl", "error.jsp");
      mv.setViewName("template1");
    }
    return mv;
  }  

  @RequestMapping("/user/update/nickname")
  protected ModelAndView updateNickname(HttpSession session, String nickname) throws Exception {
    ModelAndView mv = new ModelAndView();

    User loginUser = (User) session.getAttribute("loginUser");

    if (loginUser == null) {
      Exception error = new Exception("login error!");
      mv.addObject("error", error);
      mv.addObject("contentUrl", "error.jsp");
      mv.setViewName("template1"); 
    } 

    loginUser.setNickname(nickname);

    userDao.updateNickname(loginUser);
    sqlSessionFactory.openSession().commit();

    mv.setViewName("redirect:../detail");
    return mv;
  }

  @RequestMapping("/user/update/password")
  protected ModelAndView updatePassword(HttpSession session, String password) throws Exception {
    ModelAndView mv = new ModelAndView();

    User loginUser = (User) session.getAttribute("loginUser");

    if (loginUser == null) {
      Exception error = new Exception("getNo()와 일치하는 회원 없음!");
      mv.addObject("error", error);
      mv.addObject("contentUrl", "error.jsp");
      mv.setViewName("template1"); 
    } 

    loginUser.setPassword(password);

    userDao.updatePassword(loginUser);
    sqlSessionFactory.openSession().commit();

    mv.setViewName("redirect:../detail");
    return mv;
  }

  @RequestMapping("/user/delete")
  protected ModelAndView delete(HttpSession session, String password) throws Exception {
    ModelAndView mv = new ModelAndView();

    User loginUser = (User) session.getAttribute("loginUser");

    if (loginUser == null) {
      Exception error = new Exception("login error!");
      mv.addObject("error", error);
      mv.addObject("contentUrl", "error.jsp");
      mv.setViewName("template1"); 
    } 

    System.out.println(loginUser.getActivityState());
    loginUser.setActivityState(User.WAITING);
    System.out.println(loginUser.getActivityState());

    userDao.updateActive(loginUser);
    sqlSessionFactory.openSession().commit();

    session.invalidate();
    mv.setViewName("redirect:../index");
    return mv;
  }


}
