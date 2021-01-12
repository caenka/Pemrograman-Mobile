import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Project Dependency
import 'package:project/variable/Colors.dart';

// CUSTOM WIDGET TEXTFIELD
class MyTextField extends StatefulWidget {
  String labelText;
  String hintText;
  bool isPasswordField;
  bool enabled;
  bool isNumber;
  IconData prefixIcon;
  IconData suffixIcon;
  EdgeInsets margin;
  Function onChange;
  Function onSubmitted;

  MyTextField({
    Key key,
    @required this.labelText,
    this.hintText,
    this.isPasswordField = false,
    this.isNumber = false,
    this.margin,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled,
    this.onChange,
    this.onSubmitted
  }) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  FocusNode _focusNode = new FocusNode();

  getPrefixIcon() {
    if (widget.prefixIcon != null) {
      return Icon(
        widget.prefixIcon,
        color: _focusNode.hasFocus ? HexColor(hex_orange) : HexColor(hex_softgray),
      );
    } else {
      return null;
    }
  }
  getSuffixIcon() {
    if (widget.suffixIcon != null) {
      return Icon(
        widget.suffixIcon,
        color: _focusNode.hasFocus ? HexColor(hex_orange) : HexColor(hex_softgray),
      );
    } else {
      return null;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return Container(
      margin: widget.margin != null ? widget.margin : EdgeInsets.only(bottom: 10),
      child: TextField(
        enabled: widget.enabled != null ? widget.enabled : true,
        onTap: () {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        focusNode: _focusNode,
        onChanged: widget.onChange,
        onSubmitted: widget.onSubmitted,
        obscureText: widget.isPasswordField,
        keyboardType: widget.isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
            filled: true,
            fillColor: HexColor(hex_light),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                color: HexColor(hex_softgray)
                )
            ),
            labelText: widget.labelText,
            prefixIcon: this.getPrefixIcon(),
            suffixIcon: this.getSuffixIcon(),
            labelStyle: TextStyle(
                color: widget.enabled == false ? HexColor(hex_dark) : _focusNode.hasFocus ? HexColor(hex_orange) : HexColor(hex_softgray),
                fontWeight: FontWeight.bold,
                fontSize: 14,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle (
                color: HexColor(hex_softgray),
                fontSize: 14.0,
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
      ),
    );
  }
}