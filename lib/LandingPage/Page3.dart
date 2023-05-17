import 'package:expense/LandingPage/MainPageLanding.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color.fromARGB(255, 252, 209, 130),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            "./assets/input.json",
            height: 200,
            frameRate: FrameRate(60),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Enter Your Name"),
          Container(
            width: 200,
            child: TextField(
              controller: input,
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              style: GoogleFonts.cabin(fontSize: 25),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Color.fromARGB(110, 0, 0, 0))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    );
  }
}
