package com.woo.pms.domain;

import java.sql.Date;

public class User {

  private static final int ACTIVE = 1;
  private static final int WAITING = 2;
  private static final int SECESSION = 3;

  private int no;
  private String name;
  private String nickname;
  private String email;
  private String password;
  private String photo;
  private String tel;
  private Date joinDate;
  private int activityState;

  @Override
  public String toString() {
    return "User [no=" + no + ", name=" + name + ", nickname=" + nickname + ", email=" + email
        + ", password=" + password + ", photo=" + photo + ", tel=" + tel + ", joinDate=" + joinDate
        + ", activityState=" + activityState + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getNickname() {
    return nickname;
  }

  public void setNickname(String nickname) {
    this.nickname = nickname;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getPhoto() {
    return photo;
  }

  public void setPhoto(String photo) {
    this.photo = photo;
  }

  public String getTel() {
    return tel;
  }

  public void setTel(String tel) {
    this.tel = tel;
  }

  public Date getJoinDate() {
    return joinDate;
  }

  public void setJoinDate(Date joinDate) {
    this.joinDate = joinDate;
  }

  public int getActivityState() {
    return activityState;
  }

  public void setActivityState(int activityState) {
    this.activityState = activityState;
  }

  public static int getActive() {
    return ACTIVE;
  }

  public static int getWaiting() {
    return WAITING;
  }

  public static int getSecession() {
    return SECESSION;
  }


}