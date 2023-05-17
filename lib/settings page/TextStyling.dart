import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyling extends StatelessWidget {
  TextStyling(this.a, this.b, this.c, this.d);
  String a, b, c, d;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "   " + a,
            style:
                GoogleFonts.roboto(fontSize: 33, fontWeight: FontWeight.w300),
          ),
          Text(
            b + "  ",
            style:
                GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w400),
          ),
          Text(
            c,
            style:
                GoogleFonts.roboto(fontSize: 33, fontWeight: FontWeight.w300),
          ),
          Text(
            d,
            style:
                GoogleFonts.roboto(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
