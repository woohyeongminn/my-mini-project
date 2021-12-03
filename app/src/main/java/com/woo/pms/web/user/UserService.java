package com.woo.pms.web.user;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.woo.pms.dao.UserDao;

@Service
public class UserService {

  @Autowired UserDao userDao;
  @Autowired SqlSessionFactory sqlSessionFactory;
  @Autowired ServletContext sc;  

  public void nicknameOverlap(String nick, HttpServletResponse response) throws IOException {

    String nickname;

    try {
      nickname = userDao.nicknameOverlap(nick);

      if (nickname == null) {                
        response.getWriter().print("1");

      } else if (nickname != null) {         
        response.getWriter().print("0");
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
  }  

}
