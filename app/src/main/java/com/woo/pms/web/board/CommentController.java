package com.woo.pms.web.board;

import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.woo.pms.dao.CommentDao;
import com.woo.pms.domain.Comment;
import com.woo.pms.domain.User;

@Controller
public class CommentController {

  @Autowired CommentDao commentDao;
  @Autowired SqlSessionFactory sqlSessionFactory;

  @PostMapping("/comment/add")
  public ModelAndView add(HttpSession session, Comment comment, int boardNo) throws Exception {
    ModelAndView mv = new ModelAndView();

    User writer = (User) session.getAttribute("loginUser");

    comment.setWriter(writer);
    commentDao.insert(boardNo, comment);
    sqlSessionFactory.openSession().commit();
    mv.setViewName("redirect:../board/detail?no=" + boardNo);
    return mv;
  }
}