package com.woo.pms.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.woo.pms.domain.Comment;

public interface CommentDao {

  void insert(@Param("boardNo")int boardNo, @Param("comment")Comment comment) throws Exception;
  void update(Comment comment) throws Exception;
  void delete(int commentNo) throws Exception;

  List<Comment> findAllByNo(int BoardNo) throws Exception;

}
