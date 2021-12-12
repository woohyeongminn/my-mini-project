package com.woo.pms.web.board;

import java.util.HashMap;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.woo.pms.dao.BoardDao;
import com.woo.pms.dao.CommentDao;
import com.woo.pms.domain.Board;
import com.woo.pms.domain.Comment;
import com.woo.pms.domain.User;

@Controller
public class BoardController {

  @Autowired BoardDao boardDao;
  @Autowired CommentDao commentDao;
  @Autowired SqlSessionFactory sqlSessionFactory;

  @RequestMapping("/board/form")
  public ModelAndView form() {
    ModelAndView mv = new ModelAndView();

    mv.addObject("contentUrl", "board/BoardForm.jsp");
    mv.setViewName("template1");

    return mv;

  }

  @PostMapping("/board/add")
  protected ModelAndView add(Board board, HttpSession session) throws Exception {
    ModelAndView mv = new ModelAndView();

    User writer = (User) session.getAttribute("loginUser");

    if (writer != null) {
      board.setWriter(writer);
      boardDao.insert(board);
      sqlSessionFactory.openSession().commit();
      mv.setViewName("redirect:list");
    } else {
      Exception error = new Exception("login error!");
      mv.addObject("error", error);
      mv.addObject("contentUrl", "error.jsp");
      mv.setViewName("template1"); 
    }
    return mv;
  }


  @RequestMapping("/board/list")
  public ModelAndView list(@RequestParam(defaultValue = "1") int pageNo,
      @RequestParam(defaultValue = "10") int pageSize) throws Exception {
    ModelAndView mv =  new ModelAndView();

    int count = boardDao.count();

    if (pageSize < 5 || pageSize > 10) {
      pageSize = 10;
    }

    int totalPage = count / pageSize + ((count % pageSize) > 0 ? 1 : 0);

    if (pageNo < 1 || pageNo > totalPage) {
      pageNo = 1;
    }

    HashMap<String,Object> params = new HashMap<>();
    params.put("offset", pageSize * (pageNo - 1));
    params.put("length", pageSize);

    List<Board> boardList = boardDao.findAll(params);

    if (boardList.isEmpty()) {
      Exception error = new Exception("board-list error!");
      mv.addObject("error", error);
      mv.addObject("contentUrl", "error.jsp");
      mv.setViewName("template1");

    }

    mv.addObject("totalPage", totalPage);
    mv.addObject("pageNo", pageNo);
    mv.addObject("pageSize", totalPage);
    mv.addObject("totalPage", totalPage);
    mv.addObject("boardList", boardList);
    mv.addObject("contentUrl", "board/BoardList.jsp");
    mv.setViewName("template1");

    return mv;
  }

  @RequestMapping("/board/detail")
  public ModelAndView detail(int no) throws Exception {
    ModelAndView mv = new ModelAndView();

    Board board = boardDao.findByNo(no);
    List<Comment> commentList = commentDao.findAllByNo(no);

    for (Comment c : commentList) {
      System.out.println(c);
    }

    boardDao.updateViewCount(no);
    sqlSessionFactory.openSession().commit();

    mv.addObject("board", board);
    mv.addObject("commentList", commentList);
    mv.addObject("contentUrl", "board/BoardDetail.jsp");
    mv.setViewName("template1");

    return mv;
  }

  @RequestMapping("/board/update")
  public ModelAndView updat(Board board) throws Exception {
    ModelAndView mv = new ModelAndView();

    boardDao.updateTitle(board);
    boardDao.updateContent(board);
    sqlSessionFactory.openSession().commit();

    System.out.println(board);

    mv.setViewName("redirect:detail"+"?no=" + board.getNo());

    return mv;
  }

  @RequestMapping("/board/delete")
  public ModelAndView delete(int no) throws Exception {
    ModelAndView mv = new ModelAndView();

    boardDao.delete(no);
    sqlSessionFactory.openSession().commit();
    mv.setViewName("redirect:list");

    return mv;
  }


}
