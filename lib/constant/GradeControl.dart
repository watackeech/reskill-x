import 'dart:ui';
import 'package:reskill_x/constant/colors.dart';

class GradeControl{

  GradeControl(){
    print("呼び出し成功");
  }

  //引数EXPから対応グレードを返す
  String getGradeFromExp(int exp){
    String grade='';

    //ビジター
    if(0<=exp&&exp<300){
      grade='ビジター';
      return grade;
    }

    //ブロンズ
    else if (300<=exp&&exp<1000){
      grade='ブロンズ';
      return grade;
    }

    //シルバー
    else if (1000<=exp&&exp<3000){
      grade='シルバー';
      return grade;
    }

    //ゴールド
    else if (3000<=exp&&exp<6000){
      grade='ゴールド';
      return grade;
    }

    //プラチナ
    else if (6000<=exp&&exp<12000){
      grade='プラチナ';
      return grade;
    }

    //クリスタル
    else if (12000<=exp&&exp<24000){
      grade='クリスタル';
      return grade;
    }

    //マスター
    else if (24000<=exp){
      grade='マスター';
      return grade;
    }

    else{
      return grade;
    }
  }//getGradeFromExp

  //EXPに対応した色
  Color getGradeColor(int exp){
    //ビジター
    if(0<=exp&&exp<300){
      return kVisitor;
    }

    //ブロンズ
    else if (300<=exp&&exp<1000){
      return kBronze;
    }

    //シルバー
    else if (1000<=exp&&exp<3000){
      return kSilver;
    }

    //ゴールド
    else if (3000<=exp&&exp<6000){
      return kGold;
    }

    //プラチナ
    else if (6000<=exp&&exp<12000){
      return kPratinum;
    }

    //クリスタル
    else if (12000<=exp&&exp<24000){
      return kCristal;
    }

    //マスター
    else if (24000<=exp){
      return kMaster;
    }

    else{
      return kWhite;
    }
  }//getGradeColor

  int getNextGradePoint(int exp){
    //ビジター
    if(0<=exp&&exp<300){
      return 300-exp;
    }

    //ブロンズ
    else if (300<=exp&&exp<1000){
      return 1000-exp;
    }

    //シルバー
    else if (1000<=exp&&exp<3000){
      return 3000-exp;
    }

    //ゴールド
    else if (3000<=exp&&exp<6000){
      return 6000-exp;
    }

    //プラチナ
    else if (6000<=exp&&exp<12000){
      return 12000-exp;
    }

    //クリスタル
    else if (12000<=exp&&exp<24000){
      return 24000-exp;
    }

    //マスター
    else if (24000<=exp){
      return 0;
    }

    else{
      return 0;
    }
  }

}