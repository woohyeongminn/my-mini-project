package com.woo.pms.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.woo.pms.domain.User;

public interface UserDao {

  void insert(User user) throws Exception;

  void updateNickname(User user) throws Exception;
  void updatePhoto(User user) throws Exception;
  void updatePassword(User user) throws Exception;
  void updateActive(User user) throws Exception;

  List<User> findAll() throws Exception;
  User findByNo(int no) throws Exception;
  User findByEmailAndPassword(@Param("email") String email, @Param("password") String password) throws Exception;
  User findEmailByNameAndTel(@Param("name") String name, @Param("tel") String tel) throws Exception;
  User findByNameAndEmail(@Param("name") String name, @Param("email") String email) throws Exception;

  String nicknameOverlap(String nickname) throws Exception;
}
