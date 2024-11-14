
import 'package:alaa_package/alaa_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

import 'AlaaMaterialColor.dart';

class AlaaStyle
{
  static AlaaStyle _style=AlaaStyle.defaultStyle();
  static AlaaStyle? _darkStyle;
  static AlaaStyle get style{
  var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  bool isDarkMode = brightness == Brightness.dark;
    if(isDarkMode&&_darkStyle!=null)
      {
        return _darkStyle!;
      }
    return _style;
  }
  static AlaaStyle get darkStyle=>_darkStyle??_style;
  static AlaaStyle get lightStyle=>_style;

  static setStyle(AlaaStyle newStyle,{AlaaStyle? darkStyle}) {
    _style = newStyle;
    _darkStyle=darkStyle;
  }

static getTheme( dynamic value)=>  ThemeDecoder.decodeThemeData(
  value,
  validate: true,
  ) ??
  ThemeData(
  scaffoldBackgroundColor: _style.accentColor,
  colorScheme: ColorScheme.fromSeed(seedColor: _style.mainColor)
  );
  static ThemeData setStyleAndGetTheme(AlaaStyle newStyle,dynamic value)
  {_style = newStyle;
  
      return ThemeDecoder.decodeThemeData(
        value,
        validate: true,
      ) ??
          ThemeData(
            scaffoldBackgroundColor: _style.accentColor,
            colorScheme: ColorScheme.fromSeed(seedColor: _style.mainColor)
          );
    
  }

 final  MaterialColor mainColor;
 final  MaterialColor secondaryColor;
 final  MaterialColor accentColor;
 final  MaterialColor black;
 final  MaterialColor white;
 final  MaterialColor color1;
 final  MaterialColor color2;
 final  MaterialColor color3;
 final  MaterialColor color4;
 final Color transparent;
 final  double defaultRadius;
 final  int defaultDoubleCount;
 final  double hMargin;
 final  double vMargin;

   AlaaStyle(
       {
         required this.mainColor,
         required this.secondaryColor,
         required  this.accentColor,
         required this.black,
         required  this.white,
         required  this.color1,
         required  this.color2,
         required  this.color3,
         required   this.color4,
      this.defaultRadius=10,
      this.defaultDoubleCount=2,
      this.hMargin=10,
      this.vMargin=10,
      required this.transparent});

/*factory AlaaStyle.from({MaterialColor? mainColor,
  MaterialColor? secondaryColor,
  MaterialColor? accentColor,
  MaterialColor? black,
  MaterialColor? white,
  MaterialColor? color1,
  MaterialColor? color2,
  MaterialColor? color3,
  MaterialColor? color4,
  double? defaultRadius,
  int? defaultDoubleCount,
  double? hMargin,
  double? vMargin,
  MaterialColor? transparent}){

}*/
factory AlaaStyle.defaultStyle(){
  return AlaaStyle(mainColor: AlaaMaterialColor.fromColor(Colors.teal),
      secondaryColor: AlaaMaterialColor.fromColor(Colors.teal.shade900),
      accentColor: AlaaMaterialColor.fromColor(Colors.teal.shade50),
      black: AlaaMaterialColor.fromColor(Colors.black),
      white: AlaaMaterialColor.fromColor(Colors.white),
      color1: AlaaMaterialColor.fromColor(Colors.teal.shade200),
      color2: AlaaMaterialColor.fromColor(Colors.teal.shade400),
      color3: AlaaMaterialColor.fromColor(Colors.teal.shade600),
      color4: AlaaMaterialColor.fromColor(Colors.teal.shade800),
      transparent: AlaaMaterialColor.fromColor(Colors.transparent)
  );
}


   Future msgDialog({required String title, required String message,
    Duration? duration,int? iconType,OnTap? onTap})async
  {

    Widget? icon;
    if(iconType!=null)
    {
      IconData iconData;
      if(iconType==1) {
        iconData = Icons.done_outline_rounded;
      }
      else if(iconType==2) {
        iconData = Icons.details;
      }  else if(iconType==3) {
        iconData = Icons.error_rounded;
      }  else  {
        iconData = Icons.delete_forever_rounded;
      }
      icon=Icon(iconData);
    }
    Get.snackbar(title, message,duration: duration??const Duration(seconds: 5),
        titleText:Text(title,textAlign: TextAlign.center,
          textDirection:TextDirection.rtl,style: textStyle(fontWeight: FontWeight.bold),),
        messageText: Text(message,textAlign: TextAlign.center,
          textDirection:TextDirection.rtl,),icon:icon,snackStyle:SnackStyle.FLOATING,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,onTap:onTap );
    await Future.delayed(duration??const Duration(seconds: 5));
    return;

  }
   TextStyle textStyle({Color? color,double? size,FontWeight? fontWeight,String? fontFamily,
    List<Shadow>? shadows,TextDecoration? decoration})
  {
    return TextStyle(
        fontFamily: fontFamily,
        color: color ,
        fontSize: size??14,
        fontWeight: fontWeight,
        shadows:shadows,
        decoration:decoration//  TextDecoration.lineThrough
      //??FontWeight.bold,

    );
  }
   OutlineInputBorder outlineInputBorder({Color? color,double? width, BorderRadius? borderRadius })
  {

    return OutlineInputBorder(
      borderSide: BorderSide(color:color??mainColor,width:width??1 ,style:BorderStyle.solid),
      borderRadius: borderRadius??borderRadiusAll(),

    );}
   BoxDecoration containerDecoration({Color? color,
    Gradient? gradient,Border? border,
    BorderRadius? borderRadius,
    double? radius,

    double? bottomLeft,List<BoxShadow>? boxShadow})
  {
    BoxDecoration boxDecoration=BoxDecoration(
        border: border,
        borderRadius:borderRadius?? borderRadiusAll(radius: radius??defaultRadius),
        color:color?? Colors.white,
        boxShadow:boxShadow?? [
          BoxShadow(
              color: Colors.black45,
              offset: Offset(3, 3),
              spreadRadius: -8,
              blurRadius: 7)
        ]
    );
    return boxDecoration;
  }
   Border borderAll({Color? borderColor,double? borderWidth})
  {
    return Border.all(
      color: borderColor??mainColor,
      width: borderWidth??0,
      style : BorderStyle.solid,
    );
  }
   Border borderOnly({Color? topColor,Color? bottomColor,Color? leftColor,Color? rightColor,double? top,double? bottom,double? right,double? left})
  {
    return Border(
      top: BorderSide(
          width: top??0,
          color: topColor??transparent,
          style: BorderStyle.solid
      ),
      bottom: BorderSide(
          width: bottom??0,
          color: bottomColor??transparent,
          style: BorderStyle.solid
      ),
      left: BorderSide(
          width: left??0,
          color: leftColor??transparent,
          style: BorderStyle.solid
      ),
      right: BorderSide(
          width: right??0,
          color: rightColor??transparent,
          style: BorderStyle.solid
      ),
    );
  }
   BorderRadius borderRadiusAll({double? radius})
  {
    return BorderRadius.circular(radius??defaultRadius);
  }
   ButtonStyle buttonStyle(
      {Color? color, OutlinedBorder? shape, double? padding})
  {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color??mainColor),
      shape:MaterialStateProperty.all(shape??const CircleBorder(side:BorderSide(width: 0,color: Colors.transparent) )),
      padding: MaterialStateProperty.all(EdgeInsets.all(padding??10)),
      shadowColor: MaterialStateProperty.all(color??Colors.transparent),
      minimumSize: MaterialStateProperty.all(const Size(10, 10)),

      // enableFeedback: false,
      alignment: Alignment.center,
    );
  }
   BorderRadius borderRadiusOnly({double? topRight,double? topLeft,double? bottomRight,double? bottomLeft})
  {
    return BorderRadius.only(
        bottomLeft:Radius.circular(bottomLeft??0),
        bottomRight: Radius.circular(bottomRight??0),
        topLeft: Radius.circular(topLeft??0),
        topRight: Radius.circular(topRight??0)
    );
  }
   BorderRadiusDirectional borderRadiusDirectionalOnly({double? bottomEnd,
    double? bottomStart,
    double? topEnd,double? topStart})
  {
    return BorderRadiusDirectional.only(
        bottomEnd:Radius.circular(bottomEnd??0),
        bottomStart: Radius.circular(bottomStart??0),
        topEnd: Radius.circular(topEnd??0),
        topStart: Radius.circular(topStart??0)
    );
  }
   RoundedRectangleBorder cardShape({required BorderRadius borderRadius,BorderSide? side})
  {
    return RoundedRectangleBorder(
        borderRadius:borderRadius,
        side: side??BorderSide.none,
    );
  }
   EdgeInsets padding({double? all,double? vertical,double? horizontal}){
    return EdgeInsets.symmetric(vertical:all??vertical?? vMargin,horizontal:all??horizontal?? hMargin);
  }

}


/*
class AlaaStyle1
{
  static Color transparent=Colors.transparent;
  static double defaultRadius=10;
  static int defaultDoubleCount=3;
  static  double hMargin=10;
  static  double vMargin=10;
  static Future msgDialog({required String title, required String message,
    Duration? duration,int? iconType,OnTap? onTap})async
  {
    Widget? icon;
    if(iconType!=null)
    {
      IconData iconData;
      if(iconType==1) {
        iconData = Icons.done_outline_rounded;
      }
      else if(iconType==2) {
        iconData = Icons.details;
      }  else if(iconType==3) {
        iconData = Icons.error_rounded;
      }  else  {
        iconData = Icons.delete_forever_rounded;
      }
      icon=Icon(iconData);
    }
    Get.snackbar(title, message,duration: duration??const Duration(seconds: 5),
        titleText:Text(title,textAlign: TextAlign.center,
          textDirection:TextDirection.rtl,style: textStyle(fontWeight: FontWeight.bold),),
        messageText: Text(message,textAlign: TextAlign.center,
          textDirection:TextDirection.rtl,),icon:icon,snackStyle:SnackStyle.FLOATING,
        forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,onTap:onTap );
    await Future.delayed(duration??const Duration(seconds: 5));
    return;

  }
  static TextStyle textStyle({Color? color,double? size,FontWeight? fontWeight,String? fontFamily,
    List<Shadow>? shadows,TextDecoration? decoration})
  {
    return TextStyle(
        fontFamily: fontFamily,
        color: color ,
        fontSize: size??40,
        fontWeight: fontWeight,
        shadows:shadows,
        decoration:decoration//  TextDecoration.lineThrough
      //??FontWeight.bold,

    );
  }
  static OutlineInputBorder outlineInputBorder({Color? color,double? width, BorderRadius? borderRadius })
  {

    return OutlineInputBorder(
      borderSide: BorderSide(color:color??mainColor,width:width??1 ,style:BorderStyle.solid),
      borderRadius: borderRadius??borderRadiusAll(),

    );}
  static BoxDecoration containerDecoration({Color? color,
    Gradient? gradient,Border? border,
    BorderRadius? borderRadius,
    double? radius,

    double? bottomLeft,List<BoxShadow>? boxShadow})
  {
    BoxDecoration boxDecoration=BoxDecoration(
        border: border,
        borderRadius:borderRadius?? AlaaStyle1.borderRadiusAll(radius: radius??defaultRadius),
        color:color?? Colors.white,
        boxShadow:boxShadow?? [
          BoxShadow(
              color: Colors.black45,
              offset: Offset(3, 3),
              spreadRadius: -8,
              blurRadius: 7)
        ]
    );
    // if(boxShadow !=null)
    //   boxDecoration.boxShadow!.addAll(boxShadow);
// if(color==null&&gradient==null)
//   boxDecoration.color==c1;
    return boxDecoration;
  }
  static Border borderAll({Color? borderColor,double? borderWidth})
  {
    return Border.all(
      color: borderColor??mainColor,
      width: borderWidth??0,
      style : BorderStyle.solid,
    );
  }
  static Border borderOnly({Color? topColor,Color? bottomColor,Color? leftColor,Color? rightColor,double? top,double? bottom,double? right,double? left})
  {
    return Border(
      top: BorderSide(
          width: top??0,
          color: topColor??transparent,
          style: BorderStyle.solid
      ),
      bottom: BorderSide(
          width: bottom??0,
          color: bottomColor??transparent,
          style: BorderStyle.solid
      ),
      left: BorderSide(
          width: left??0,
          color: leftColor??transparent,
          style: BorderStyle.solid
      ),
      right: BorderSide(
          width: right??0,
          color: rightColor??transparent,
          style: BorderStyle.solid
      ),
    );
  }
  static BorderRadius borderRadiusAll({double? radius})
  {
    return BorderRadius.circular(radius??defaultRadius);
  }
  static ButtonStyle buttonStyle(
      {Color? color, OutlinedBorder? shape, double? padding})
  {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color??mainColor),
      shape:MaterialStateProperty.all(shape??const CircleBorder(side:BorderSide(width: 0,color: Colors.transparent) )),
      padding: MaterialStateProperty.all(EdgeInsets.all(padding??10)),
      shadowColor: MaterialStateProperty.all(color??Colors.transparent),
      minimumSize: MaterialStateProperty.all(const Size(10, 10)),

      // enableFeedback: false,
      alignment: Alignment.center,
    );
  }
  static BorderRadius borderRadiusOnly({double? topRight,double? topLeft,double? bottomRight,double? bottomLeft})
  {
    return BorderRadius.only(
        bottomLeft:Radius.circular(bottomLeft??0),
        bottomRight: Radius.circular(bottomRight??0),
        topLeft: Radius.circular(topLeft??0),
        topRight: Radius.circular(topRight??0)
    );
  }
  static BorderRadiusDirectional borderRadiusDirectionalOnly({double? bottomEnd,
    double? bottomStart,
    double? topEnd,double? topStart})
  {
    return BorderRadiusDirectional.only(
        bottomEnd:Radius.circular(bottomEnd??0),
        bottomStart: Radius.circular(bottomStart??0),
        topEnd: Radius.circular(topEnd??0),
        topStart: Radius.circular(topStart??0)
    );
  }
  static RoundedRectangleBorder cardShape({required BorderRadius borderRadius,BorderSide? side})
  {
    return RoundedRectangleBorder(
      borderRadius:borderRadius,
      side: side??BorderSide.none,
    );
  }
  static EdgeInsets padding({double? all,double? vertical,double? horizontal}){
    return EdgeInsets.symmetric(vertical:all??vertical?? vMargin,horizontal:all??horizontal?? hMargin);
  }

}*/
