package com.woo.pms.web.board;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.woo.pms.dao.BoardDao;
import com.woo.pms.domain.Board;

@Controller
public class BoardController {

  @Autowired BoardDao boardDao;
  @Autowired SqlSessionFactory sqlSessionFactory;

  @RequestMapping("/board/form")
  public ModelAndView form() {
    ModelAndView mv = new ModelAndView();

    mv.addObject("contentUrl", "board/BoardForm.jsp");
    mv.setViewName("template1");

    return mv;

  }

  @PostMapping("/board/add")
  protected ModelAndView add(Board board) throws Exception {
    boardDao.insert(board);
    sqlSessionFactory.openSession().commit();

    ModelAndView mv = new ModelAndView();
    mv.setViewName("redirect:list");
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
      Exception error = new Exception("boardDao.findAll");
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
}
