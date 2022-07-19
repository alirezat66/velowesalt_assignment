import 'package:flutter/material.dart';

extension StringExt on String{
  Color get fromPicture{
    final colorStr = split("/").last;
    int color = int.parse(colorStr);
    return Color(0xff000000 + color);
  }
}