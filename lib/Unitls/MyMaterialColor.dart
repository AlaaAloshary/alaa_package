
import 'package:alaa_package/StyleClasses/AlaaStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension MyBuildContext on Object{
  AlaaStyle get myStyle=>AlaaStyle.style;
  static setStyle(AlaaStyle newStyle,{bool reload=true}){
    AlaaStyle.setStyle(newStyle);
    if(reload)
      {
        Get.appUpdate();
      }
  }

}