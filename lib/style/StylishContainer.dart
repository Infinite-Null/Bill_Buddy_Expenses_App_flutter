// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class StylishContainer extends StatelessWidget {
  StylishContainer(this.child, this.height, this.width);
  Widget child;
  double height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(43, 0, 0, 0),
                offset: Offset(5, 5),
                blurRadius: 10,
                spreadRadius: 3)
          ]),
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      padding: EdgeInsets.all(10.0),
      child: child,
    );
  }
}
