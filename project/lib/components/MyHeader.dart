import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';

class MyHeader {
  static Text Title(String text, {double fontSize, Color color, TextAlign textAlign}) {
    return Text(
      text,
      textAlign: textAlign != null ? textAlign : TextAlign.left,
      style: TextStyle(
        fontSize: fontSize != null ? fontSize : 20,
        fontWeight: FontWeight.w800,
        color: color != null ? color : HexColor(hex_dark)
      ),
    );
  }
  static Text Subtitle(String text, {double fontSize, Color color, TextAlign textAlign}) {
    return Text(
      text,
      textAlign: textAlign != null ? textAlign : TextAlign.left,
      style: TextStyle(
        fontSize: fontSize == null ? fontSize : 16,
        fontWeight: FontWeight.bold,
        color: color != null ? color : HexColor(hex_gray)
      ),
    );
  }
}