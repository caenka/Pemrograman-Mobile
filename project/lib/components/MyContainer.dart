import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  Widget child;

  MyContainer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    return Container(
      height: mediaQuery.height,
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: this.child,
          )
        ],
      ),
    );
  }
}