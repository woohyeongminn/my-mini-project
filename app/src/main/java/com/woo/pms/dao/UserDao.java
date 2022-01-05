package com.woo.pms.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.woo.pms.domain.User;

public interface UserDao {

  void insert(User user) throws Exception;

  void updateNickname(User user) throws Exception;
  void updatePassword(User user) throws Exception;

  //  탈퇴시 활동 상태만 변경 된다.
  void updateActive(User user) throws Exception;

  List<User> findAll() throws Exception;
  // 로그인 후 내 정보 확인
  User findByNo(int no) throws Exception;
  // 로그인
  User findByEmailAndPassword(@Param("email") String email, @Param("password") String password) throws Exception;
  // 가입시 등록된 전화번호와 이름을 통한 이메일 찾기
  User findEmailByNameAndTel(@Param("name") String name, @Param("tel") String tel) throws Exception;
  // 가입시 등록된 이름과 이메일로 회원정보 찾은 후 임시비밀번호 발급
  User findByNameAndEmail(@Param("name") String name, @Param("email") String email) throws Exception;
  // 닉네임 중복확인 
  String nicknameOverlap(String nickname) throws Exception;
}
