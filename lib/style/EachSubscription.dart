// ignore_for_file: must_be_immutable

import 'package:expense/Data/SubscriptionDate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EachSubscrtption extends StatelessWidget {
  String name;
  double amount;
  DateTime from;
  DateTime to;
  int index;
  bool isAbout;
  EachSubscrtption(
      this.name, this.amount, this.from, this.to, this.index, this.isAbout);
  List<Color> gradientColor() {
    if (name.toLowerCase() == 'netflix' ||
        name.toLowerCase().contains("netflix")) {
      return [
        Color.fromARGB(221, 250, 56, 56),
        Color.fromARGB(134, 255, 45, 45)
      ];
    } else if (name.toLowerCase() == 'amazon' ||
        name.toLowerCase() == 'amazon prime' ||
        name.toLowerCase() == 'prime' ||
        name.toLowerCase().contains("amazon")) {
      return [
        Color.fromARGB(221, 56, 140, 250),
        Color.fromARGB(133, 45, 171, 255)
      ];
    } else if (name.toLowerCase() == 'diseny' ||
        name.toLowerCase() == 'diseny plus' ||
        name.toLowerCase() == 'diseny plus hotstar' ||
        name.toLowerCase() == 'hotstar' ||
        name.toLowerCase().contains("disney")) {
      return [
        Color.fromARGB(221, 56, 75, 250),
        Color.fromARGB(133, 45, 143, 255)
      ];
    } else if (name.toLowerCase() == 'aws') {
      return [Color.fromARGB(221, 37, 37, 37), Color.fromARGB(133, 34, 34, 34)];
    } else if (name.toLowerCase() == 'adobe' ||
        name.toLowerCase().contains('adobe')) {
      return [
        Color.fromARGB(221, 250, 134, 56),
        Color.fromARGB(133, 255, 188, 45)
      ];
    } else if (name.toLowerCase() == 'cloud' ||
        name.toLowerCase().contains('cloud')) {
      return [
        Color.fromARGB(221, 205, 56, 250),
        Color.fromARGB(133, 230, 45, 255)
      ];
    } else if (name.toLowerCase() == 'photo' ||
        name.toLowerCase().contains('photos')) {
      return [
        Color.fromARGB(242, 250, 159, 56),
        Color.fromARGB(178, 255, 216, 45)
      ];
    } else {
      return [
        Color.fromARGB(221, 49, 187, 230),
        Color.fromARGB(133, 45, 171, 255)
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (isAbout)
          ? MediaQuery.of(context).size.width / 1.1
          : MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 3.8,
      margin: EdgeInsets.fromLTRB(7, 7, 15, 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(colors: gradientColor()),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.3),
            offset: Offset(5, 5),
            blurRadius: 10,
          )
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    child: Text(name.toUpperCase(),
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800)),
                  ),
                )),
          ),
          (to.isBefore(DateTime.now()))
              ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(111, 0, 0, 0),
                                offset: Offset(5, 5))
                          ],
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Text("Expired",
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(fontSize: 20, color: Colors.red)
                          // GoogleFonts.actor(fontSize: 20, color: Colors.red),
                          )),
                )
              : Container(),
          Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 180,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Text(
                                "From :   ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 18, color: Colors.black),
                              ),
                              Spacer(),
                              Text(
                                DateFormat.yMd().format(from),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 180,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "To :   ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 18, color: Colors.black),
                              ),
                              Spacer(),
                              Text(
                                DateFormat.yMd().format(to),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(
                                        fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Text(name.substring(0, 1).toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                      fontWeight: FontWeight.w100,
                                      shadows: [
                                        Shadow(
                                            color: Color.fromARGB(
                                                255, 241, 107, 97),
                                            offset: Offset(-2, 0)),
                                        Shadow(
                                            color: Color.fromARGB(
                                                255, 243, 201, 123),
                                            offset: Offset(2, 0))
                                      ],
                                      fontSize: 40,
                                      color:
                                          Color.fromARGB(255, 87, 144, 250))),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return DialogFb1(index);
                                });
                          },
                          child: Container(
                              height: 40,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.red)),
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Amount",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 18, color: Colors.white),
                  ),
                  Text(
                    NumberFormat.simpleCurrency(
                            locale: 'hi-IN', decimalDigits: 0)
                        .format(amount),
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 40, color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DialogFb1 extends StatelessWidget {
  int i;
  DialogFb1(this.i);
  SubscriptionData a = Get.put(SubscriptionData());
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
              child: Text(
                  "Are you sure you want to delete " +
                      a.subscriptions[i]["name"].toString().toUpperCase() +
                      " ?",
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
                      a.removeSubs(i);
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
