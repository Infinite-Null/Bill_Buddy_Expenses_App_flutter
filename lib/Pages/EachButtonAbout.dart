import 'package:flutter/material.dart';

class AboutButton extends StatelessWidget {
  String text;

  String tag2;
  AboutButton(this.text, this.tag2);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag2,
      child: Container(
        height: 80,
        alignment: Alignment.center,
        width: double.infinity,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(45, 0, 0, 0),
                  offset: Offset(5, 5),
                  spreadRadius: 2,
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 255, 255, 255)),
        child: Container(
            alignment: Alignment.center,
            height: 40,
            width: double.infinity,
            child: Text(text, style: Theme.of(context).textTheme.headline1)),
      ),
    );
  }
}
