
import 'package:flutter/material.dart';

class AlaaMaterialColor extends MaterialColor{
  const AlaaMaterialColor(super.primary, super.swatch);


  factory  AlaaMaterialColor.fromColor(Color color){
if(color is MaterialColor)
  {
    return AlaaMaterialColor(color.value,{
      50:color.shade50,
      100:color.shade100,
      200:color.shade200,
      300:color.shade300,
      400:color.shade400,
      500:color.shade500,
      600:color.shade600,
      700:color.shade700,
      800:color.shade800,
      900:color.shade900,
    });
  }
  return AlaaMaterialColor(color.value,{
    50:color.withOpacity(.1),
    100:color.withOpacity(.2),
    200:color.withOpacity(.3),
    300:color.withOpacity(.4),
    400:color.withOpacity(.5),
    500:color.withOpacity(.6),
    600:color.withOpacity(.7),
    700:color.withOpacity(.8),
    800:color.withOpacity(.9),
    900:color,
  });
  }
  factory  AlaaMaterialColor.from(var color){

    Color value=Colors.black;
    if(color is int)
      {
        value= Color(color);
      }
   else if(color is String)
      {
        value=Color(int.parse(color));
      }
    else if (color is Color)
      {
        value=color;
      }
    else
    {
      assert(true,"unknown color type");
    }
    return AlaaMaterialColor.fromColor(value);
  }
  static MaterialColor getMaterialColorFromString(){

    return MaterialColor(0xffff6600,{
      50:Color(0xffff6600),
      100:Color(0xffff6600),
      200:Color(0xffff6600),
      300:Color(0xffff6600),
      400:Color(0xffff6600),
      500:Color(0xffff6600),
      600:Color(0xffff6600),
      700:Color(0xffff6600),
      800:Color(0xffff6600),
      900:Color(0xffff6600),
    });
  }
}