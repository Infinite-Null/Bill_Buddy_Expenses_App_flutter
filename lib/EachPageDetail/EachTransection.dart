// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:expense/Data/Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:left_scroll_actions/left_scroll_actions.dart';

class EachTrnsection extends StatelessWidget {
  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  String type, name;
  DateTime date;
  double amount;
  int index, i;
  EachTrnsection(
      this.name, this.amount, this.type, this.date, this.index, this.i);
  Controller a = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return TweenAnimationBuilder(
        tween: Tween(begin: EdgeInsets.all(10), end: EdgeInsets.all(0)),
        duration: Duration(milliseconds: 250),
        builder: (context, value, x) {
          return AnimatedPadding(
            duration: Duration(milliseconds: 250),
            padding: value,
            child: Container(
              padding: EdgeInsets.only(bottom: 20, left: 7, right: 7),
              child: CupertinoLeftScroll(
                  opacityChange: true,
                  closeOnPop: true,
                  bounce: true,
                  bounceStyle: BounceStyle(k: 0.4, maxDistance: 200),
                  child: Container(
                    height: height / 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(12, 26),
                            blurRadius: 50,
                            spreadRadius: 0,
                            color: Colors.grey.withOpacity(.1)),
                      ],
                      gradient: LinearGradient(
                          colors: [primaryColor, secondaryColor]),
                    ),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(38, 2, 2, 2),
                              border: Border.all(
                                  color: (type == "Get")
                                      ? Colors.green
                                      : Color.fromARGB(255, 255, 92, 81)),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                            ),
                            child: Text(
                              type,
                              style: GoogleFonts.cabin(
                                  fontSize: 23,
                                  color: (type == "Get")
                                      ? Colors.green
                                      : Color.fromARGB(255, 252, 114, 104)),
                            )),
                        Spacer(),
                        Container(
                            width: 150,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    minFontSize: 18,
                                    name.toUpperCase(),
                                    style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300)),
                                AutoSizeText(
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    minFontSize: 20,
                                    NumberFormat.simpleCurrency(
                                            locale: 'hi-IN', decimalDigits: 1)
                                        .format(amount),
                                    style: GoogleFonts.cabin(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300))
                              ],
                            )),
                        Spacer(),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color.fromARGB(31, 255, 255, 255),
                              border: Border.all(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                            ),
                            child: Text(
                              DateFormat.MMMd().format(date),
                              style: GoogleFonts.cabin(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            )),
                      ],
                    ),
                  ),
                  buttons: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ConfirmDelete(
                                  a.persons[index]["Transections"][i]["name"],
                                  index,
                                  i);
                            });
                      },
                      child: Container(
                        height: 100,
                        margin: EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ]),
            ),
          );
        });
  }
}

class ConfirmDelete extends StatelessWidget {
  String name;
  int index, i;
  ConfirmDelete(this.name, this.index, this.i);

  @override
  Widget build(BuildContext context) {
    return DialogFb1(name, index, i);
  }
}

class DialogFb1 extends StatelessWidget {
  String about;
  int index, i;
  DialogFb1(this.about, this.index, this.i);
  Controller a = Get.put(Controller());
  final primaryColor = Color.fromARGB(255, 202, 73, 56);
  final accentColor = const Color(0xffffffff);
  TextEditingController input = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.1)),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.topLeft,
              child: Text("Are you sure you want to delete " + about + " ?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 3.5,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SimpleBtn1(
                    text: "Delete",
                    onPressed: () {
                      a.removeTransection(index, i);
                      Navigator.pop(context);
                    }),
                SimpleBtn1(
                  text: "Cancel",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  invertedColors: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  SimpleBtn1(
      {required this.text,
      required this.onPressed,
      this.invertedColors = false,
      Key? key})
      : super(key: key);
  final primaryColor = Color.fromARGB(255, 202, 56, 56);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: primaryColor)),
            padding: MaterialStateProperty.all(const EdgeInsets.only(
                right: 30, left: 30, top: 13, bottom: 13)),
            backgroundColor: MaterialStateProperty.all(
                invertedColors ? accentColor : primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: invertedColors ? primaryColor : accentColor, fontSize: 16),
        ));
  }
}
