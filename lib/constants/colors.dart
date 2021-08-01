import 'package:flutter/material.dart';
import 'dart:math';

final followColor = Color.fromRGBO(56, 151, 240, 1);
final bgColor = Colors.white;
final textColor = Color.fromRGBO(38, 38, 38, 1);
final likecolor = Color.fromRGBO(237, 73, 86, 1);

var colorlist = [ Color.fromRGBO(237, 73, 86, 1),Color.fromRGBO(56, 151, 240, 1)];

randomColor(){
  int max = colorlist.length;
  return colorlist[Random().nextInt(max) ];

}