import 'package:flutter/material.dart';

class MyBoxContainer extends StatelessWidget {
  final Color bgColor;
  final Widget boxChild;

  MyBoxContainer({@required this.bgColor, this.boxChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: boxChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: bgColor,
      ),
    );
  }
}
