import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';

// CUSTOM WIDGET TEXTFIELD
class MyTextField extends StatelessWidget {
  FocusNode focusNode;
  Function onChange;
  Function onSubmitted;

  MyTextField({
    Key key,
    this.focusNode,
    this.onChange,
    this.onSubmitted
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      onChanged: onChange,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        filled: true,
        fillColor: HexColor(hex_light),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColor(hex_softgray)
          )
        ),
        labelText: 'Cari History Donasi',
        prefixIcon: Icon(
          Icons.search,
          color: focusNode.hasFocus ? HexColor(hex_orange) : HexColor(hex_softgray),
        ),
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? HexColor(hex_orange) : HexColor(hex_softgray),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        hintText: 'Ketikan Nama History',
        hintStyle: TextStyle (
          color: HexColor(hex_softgray),
          fontSize: 14.0
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: HexColor(hex_orange)
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10, horizontal: 10
        )
      ),
    );
  }
}