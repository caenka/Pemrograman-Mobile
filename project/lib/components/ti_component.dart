import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/variable/Colors.dart';

class TiComponent extends StatelessWidget{
  final bool isPassword;
  final String label;
  final String hint;
  final String Function(String) validate;
  final void Function(String) change;

  TiComponent({
    this.isPassword = false,
    @required this.label,
    this.hint ="",
    @required this.validate,
    @required this.change,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: HexColor(hex_darkorange)
          ),
          hintText: hint,
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: HexColor(hex_dark)))
      ),
      validator: validate,
      onChanged: change,
    );
  }

}