package com.woo.pms.util;

import java.util.Random;

public class RandomPw {

  public String randomPw() {

    Random random = new Random();
    int length = random.nextInt(5)+5;

    StringBuffer newWord = new StringBuffer();
    for (int i = 0; i < length; i++) {
      int mixed = random.nextInt(3);
      switch(mixed) {
        case 0:
          newWord.append(randomWord("lower", 1));
          break;
        case 1:
          newWord.append(randomWord("upper", 1));
          break;
        case 2:
          newWord.append(randomWord("number", 1));
          break;
        default:
          break;
      }
    }
    String s1 = newWord.toString();
    return s1;

  }
  static String randomWord(String selectCase, int length){
    if (selectCase == "lower"){
      String lowerRandom ="";
      for (int i = 0; i < length; i++) {
        char lowerCh = (char)((int)(Math.random()*25) + 97);
        lowerRandom += lowerCh;
      }
      return lowerRandom;
    }
    if (selectCase == "upper"){
      String upperRandom ="";
      for (int i = 0; i < length; i++) {
        char upperCh = (char)((int)(Math.random()*25) + 65);
        upperRandom += upperCh;
      }
      return upperRandom;
    }
    if (selectCase == "number"){
      String numRandom ="";
      for (int i = 0; i < length; i++) {
        char ch = (char)((int)(Math.random()*10) + 48);
        numRandom += ch;
      }
      return numRandom;
    }
    return null;
  }
}
