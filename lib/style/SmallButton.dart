// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallButton extends StatelessWidget {
  SmallButton(this.text, this.color);
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(

          // color: Colors.green,
          color: color,
          borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            text,
            style: GoogleFonts.cabin(fontSize: 12.3, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
