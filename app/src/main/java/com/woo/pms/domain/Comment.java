package com.woo.pms.domain;

import java.sql.Date;

public class Comment {

  private int no;
  private String comment;
  private User writer;
  private int likeCount;
  private int hateCount;
  private Date createDate;

  @Override
  public String toString() {
    return "Comment [no=" + no + ", comment=" + comment + ", writer=" + writer + ", likeCount="
        + likeCount + ", hateCount=" + hateCount + ", createDate=" + createDate + "]";
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
  }

  public User getWriter() {
    return writer;
  }

  public void setWriter(User writer) {
    this.writer = writer;
  }

  public int getLikeCount() {
    return likeCount;
  }

  public void setLikeCount(int likeCount) {
    this.likeCount = likeCount;
  }

  public int getHateCount() {
    return hateCount;
  }

  public void setHateCount(int hateCount) {
    this.hateCount = hateCount;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }


}
