package com.woo.pms.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {


  @GetMapping("/index")
  public ModelAndView index() throws Exception {

    ModelAndView mv = new ModelAndView();
    mv.addObject("pageTitle", "main");
    mv.addObject("contentUrl", "index.jsp");
    mv.setViewName("template1");
    return mv;
  }
}
