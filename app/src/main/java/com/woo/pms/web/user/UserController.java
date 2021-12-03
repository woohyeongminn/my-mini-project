package com.woo.pms.web.user;

import java.io.IOException;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
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
import net.coobird.thumbnailator.ThumbnailParameter;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import net.coobird.thumbnailator.name.Rename;
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

    mv.addObject("pageTitle", "📝join");
    mv.addObject("contentUrl", "user/UserForm.jsp");
    mv.setViewName("template1");    

    return mv;
  }

  @PostMapping("/user/add")
  protected ModelAndView add(User user, Part photoFile, String[] telNo, String nick, String id, String site) throws Exception {

    String tel = telNo[0] + "-" + telNo[1] + "-" + telNo[2];
    user.setTel(tel);

    user.setEmail(id + '@' + site);
    user.setNickname(nick);

    if (photoFile.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      photoFile.write(sc.getRealPath("/upload/user") + "/" + filename);
      user.setPhoto(filename);

      Thumbnails.of(sc.getRealPath("/upload/user") + "/" + filename)
      .size(40, 40)
      .outputFormat("jpg")
      .crop(Positions.CENTER)
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_40x40";
        }
      });

      Thumbnails.of(sc.getRealPath("/upload/user") + "/" + filename)
      .size(80, 80)
      .outputFormat("jpg")
      .crop(Positions.CENTER)
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_80x80";
        }
      });

      Thumbnails.of(sc.getRealPath("/upload/user") + "/" + filename)
      .size(110, 110)
      .outputFormat("jpg")
      .crop(Positions.CENTER)
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_110x110";
        }
      });

    } else {

      user.setPhoto("perProfile");
    }

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
      Exception error = new Exception("로그인한 회원 없음!");
      mv.addObject("pageTitle", "페이지 오류");
      mv.addObject("error", error);
      mv.addObject("contentUrl", "../error.jsp");
      mv.setViewName("template1");
      return mv;
    } 

    User user = userDao.findByNo(loginUser.getNo());

    if (user != null) {
      mv.addObject("user", user);
      mv.addObject("pageTitle", "📜 마이페이지");
      mv.addObject("contentUrl", "user/UserDetail.jsp");
      mv.setViewName("template1");

    } else {
      Exception error = new Exception("getNo()와 일치하는 회원 없음!");
      mv.addObject("pageTitle", "페이지 오류");
      mv.addObject("error", error);      
      mv.addObject("contentUrl", "../error.jsp");
      mv.setViewName("template1");
    }
    return mv;
  }  

  @RequestMapping("/user/updateform")
  public ModelAndView updateForm(HttpSession session) throws Exception {
    ModelAndView mv = new ModelAndView();

    User loginPer = (User) session.getAttribute("loginUser");

    if (loginPer == null) {
      Exception error = new Exception("로그인한 회원 없음!");
      mv.addObject("pageTitle", "페이지 오류");
      mv.addObject("error", error);
      mv.addObject("contentUrl", "../error.jsp");
      mv.setViewName("template1");
      return mv;
    } 

    User user = userDao.findByNo(loginPer.getNo());

    if (user != null) {
      mv.addObject("user", user);
      mv.addObject("pageTitle", "📜 마이페이지");
      mv.addObject("contentUrl", "user/UserUpdate.jsp");
      mv.setViewName("template1");

    } else {
      Exception error = new Exception("getNo()와 일치하는 회원 없음!");
      mv.addObject("error", error);
      mv.addObject("pageTitle", "페이지 오류");
      mv.addObject("contentUrl", "../error.jsp");
      mv.setViewName("template1");      
    }
    return mv;
  }

  @RequestMapping("/user/update")
  protected ModelAndView update(User user, Part photoFile, String nick) throws Exception {
    ModelAndView mv = new ModelAndView();

    User oldUser = userDao.findByNo(user.getNo());

    if (oldUser == null) {
      Exception error = new Exception("getNo()와 일치하는 회원 없음!");
      mv.addObject("error", error);
      mv.addObject("pageTitle", "페이지 오류");
      mv.addObject("contentUrl", "../error.jsp");
      mv.setViewName("template1"); 
    } 

    if (photoFile.getSize() > 0) {
      String filename = UUID.randomUUID().toString();
      photoFile.write(sc.getRealPath("/upload/user") + "/" + filename);
      user.setPhoto(filename);

      Thumbnails.of(sc.getRealPath("/upload/user") + "/" + filename)
      .size(40, 40)
      .outputFormat("jpg")
      .crop(Positions.CENTER)
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_40x40";
        }
      });

      Thumbnails.of(sc.getRealPath("/upload/user") + "/" + filename)
      .size(80, 80)
      .outputFormat("jpg")
      .crop(Positions.CENTER)
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_80x80";
        }
      });

      Thumbnails.of(sc.getRealPath("/upload/user") + "/" + filename)
      .size(80, 80)
      .outputFormat("jpg")
      .crop(Positions.CENTER)
      .toFiles(new Rename() {
        @Override
        public String apply(String name, ThumbnailParameter param) {
          return name + "_110x110";
        }
      });

      user.setPhoto(filename);
      user.setNickname(nick);
      user.setJoinDate(oldUser.getJoinDate());

    } else {
      // 기존 정보로 
      user.setPhoto(oldUser.getPhoto());
      user.setNickname(nick);
      user.setJoinDate(oldUser.getJoinDate());
    }

    userDao.updateNickname(user);
    userDao.updatePassword(user);
    userDao.updatePhoto(user);
    sqlSessionFactory.openSession().commit();

    mv.setViewName("redirect:detail");
    return mv;
  }  


}
