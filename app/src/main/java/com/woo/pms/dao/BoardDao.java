package com.woo.pms.dao;

import java.util.List;
import java.util.Map;
import com.woo.pms.domain.Board;

public interface BoardDao {

  void insert(Board board) throws Exception;

  void updateTitle(Board board) throws Exception;
  void updateContent(Board board) throws Exception;
  void updateViewCount(int boardNo) throws Exception;

  void delete(int no) throws Exception;

  Board findByNo(int boardNo) throws Exception;

  List<Board> findAll(Map<String,Object> params) throws Exception;
  int count() throws Exception;
}
