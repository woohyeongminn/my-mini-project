package com.woo.pms.domain;

public class Attachments {

  private int no;
  private String fileName;
  private String filePath;

  @Override
  public String toString() {
    return "Attachments [no=" + no + ", fileName=" + fileName + ", filePath=" + filePath + "]";
  }
  public int getNo() {
    return no;
  }
  public void setNo(int no) {
    this.no = no;
  }
  public String getFileName() {
    return fileName;
  }
  public void setFileName(String fileName) {
    this.fileName = fileName;
  }
  public String getFilePath() {
    return filePath;
  }
  public void setFilePath(String filePath) {
    this.filePath = filePath;
  }



}
