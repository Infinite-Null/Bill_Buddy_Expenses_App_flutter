// ignore_for_file: must_be_immutable

import 'package:expense/ConfrimBox/Netual.dart';
import 'package:expense/Data/Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lottie/lottie.dart';
import '../ConfrimBox/GetPage.dart';
import '../ConfrimBox/GivePage.dart';
import '../InputStyles/AddTransections.dart';
import 'EachTransection.dart';

class EachPersonTransectionDetail extends StatefulWidget {
  EachPersonTransectionDetail(this.i, this.person);
  int i;
  String person;
  @override
  State<EachPersonTransectionDetail> createState() =>
      _EachPersonTransectionDetailState(i, person);
}

class _EachPersonTransectionDetailState
    extends State<EachPersonTransectionDetail> with TickerProviderStateMixin {
  int index;
  String personName;
  String capitalize(String value) {
    var result = value[0].toUpperCase();
    bool cap = true;
    for (int i = 1; i < value.length; i++) {
      if (value[i - 1] == " " && cap == true) {
        result = result + value[i].toUpperCase();
      } else {
        result = result + value[i];
        cap = false;
      }
    }
    return result;
  }

  Controller a = Get.put(Controller());
  _EachPersonTransectionDetailState(this.index, this.personName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          title: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_rounded)),
          bottom: PreferredSize(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(12),
                    width: 190,
                    height: 120,
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      minFontSize: 30,
                      capitalize(personName),
                      style: GoogleFonts.roboto(
                          fontSize: 60, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        OutlinedButton(
                            style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(100, 20)),
                                side: MaterialStateProperty.all(
                                    BorderSide(color: Colors.deepPurple))),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return AddTransection(index);
                                  });
                            },
                            child: Text(
                              "+ Add",
                              style: GoogleFonts.cabin(
                                  color: Colors.deepPurple, fontSize: 20),
                            )),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurple)),
                            onPressed: () {
                              double sum = 0;
                              for (int i = 0;
                                  i < a.persons[index]["Transections"].length;
                                  i++) {
                                if (a.persons[index]["Transections"][i]
                                        ["type"] ==
                                    "Get") {
                                  sum += a.persons[index]["Transections"][i]
                                      ["amount"];
                                  print(sum);
                                } else {
                                  sum -= a.persons[index]["Transections"][i]
                                      ["amount"];
                                  print(sum);
                                }
                              }
                              if (sum < 0) {
                                Get.to(
                                    curve: Curves.easeInCirc,
                                    popGesture: true,
                                    duration: Duration(milliseconds: 500),
                                    () => GivePageDetail(
                                        sum, a.persons[index]["name"]),
                                    transition: Transition.circularReveal);
                              } else if (sum > 0) {
                                Get.to(
                                    curve: Curves.easeInCirc,
                                    popGesture: true,
                                    duration: Duration(milliseconds: 500),
                                    () => GetPageDetail(
                                        sum, a.persons[index]["name"]),
                                    transition: Transition.circularReveal);
                              } else {
                                Get.to(
                                    curve: Curves.easeInCirc,
                                    popGesture: true,
                                    duration: Duration(milliseconds: 500),
                                    () => Netural(a.persons[index]["name"]),
                                    transition: Transition.circularReveal);
                              }
                            },
                            child: Text(
                              "Calculate",
                              style: GoogleFonts.cabin(
                                  color: Colors.white, fontSize: 20),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              preferredSize: Size.fromHeight(120.0)),
        ),
        body: Obx(() {
          if (a.persons[index]["Transections"].length != 0) {
            return ListView.builder(
                primary: true,
                physics: BouncingScrollPhysics(),
                itemCount: a.persons[index]["Transections"].length,
                itemBuilder: (ctx, i) {
                  return EachTrnsection(
                      a.persons[index]["Transections"][i]["name"],
                      a.persons[index]["Transections"][i]["amount"],
                      a.persons[index]["Transections"][i]["type"],
                      DateTime.parse(
                          a.persons[index]["Transections"][i]["date"]),
                      index,
                      i);
                });
          } else {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    './assets/emptyTransection.json',
                    height: 250,
                    frameRate: FrameRate(60),
                    animate: true,
                    options: LottieOptions(enableMergePaths: true),
                    repeat: true,
                  ),
                  Text(
                    "No Transections",
                    style: GoogleFonts.cabin(fontSize: 20),
                  ),
                ],
              ),
            );
          }
        }));
  }
}
