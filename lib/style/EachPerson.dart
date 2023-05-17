// ignore_for_file: must_be_immutable

import 'package:expense/Data/Data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../ConfrimBox/DeleteConfrim.dart';
import '../InputStyles/Rename.dart';

class EachPerson extends StatelessWidget {
  EachPerson(this.name, this.totalTransetion, this.oweAmount,
      this.recieveAmount, this.index, this.isAbout);
  String name;
  double oweAmount, recieveAmount;
  int totalTransetion;
  int index;
  bool isAbout;
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
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    const white = Color.fromARGB(255, 0, 0, 0);
    // const secondaryColor = Color(0xff6D28D9);
    return Container(
      width: width / 1.38,
      alignment: Alignment.bottomCenter,
      child: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              // margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              margin: (isAbout)
                  ? EdgeInsets.only(top: 10, bottom: 0, right: 20, left: 20)
                  : EdgeInsets.only(top: 10, bottom: 0, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(5, 5),
                      blurRadius: 8,
                      spreadRadius: 0,
                      color: Colors.grey.withOpacity(.3)),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              width:
                  (isAbout) ? MediaQuery.of(context).size.width : width / 1.5,
              height: 261,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        FittedBox(
                          child: Text(capitalize(name),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontSize: 20, color: Colors.black)),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Transection",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontSize: 15,
                                    )),
                        FittedBox(
                          child: Text(
                              NumberFormat.compact().format(totalTransetion),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontSize: 15,
                                  )),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Owe amount:",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontSize: 15,
                                    )),
                        FittedBox(
                          child: Text(
                              NumberFormat.simpleCurrency(
                                      locale: 'hi-IN', decimalDigits: 0)
                                  .format(oweAmount),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontSize: 15,
                                  )),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recieve amount:",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      fontSize: 15,
                                    )),
                        FittedBox(
                          child: Text(
                              NumberFormat.simpleCurrency(
                                      locale: 'hi-IN', decimalDigits: 0)
                                  .format(recieveAmount),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontSize: 15,
                                  )),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(10)),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 82, 134, 245))),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (ctx) {
                                    return Rename(index);
                                  });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Remane",
                                  style: GoogleFonts.cabin(color: Colors.white),
                                )
                              ],
                            )),
                      ),
                      OutlinedButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide(
                                  color: Color.fromARGB(255, 255, 89, 77)))),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return ConfirmDelete(index);
                                });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Color.fromARGB(255, 253, 88, 76),
                              ),
                              Text(
                                "Delete",
                                style: GoogleFonts.cabin(
                                    color: Color.fromARGB(255, 252, 97, 86)),
                              )
                            ],
                          ))
                    ],
                  ),
                ],
              )),
          Container(
              height: 100,
              width: (isAbout) ? width : width / 1.53,
              child: LottieBuilder.asset(
                "./assets/profile.json",
                frameRate: FrameRate(60),
                height: 120,
              )),
        ],
      ),
    );
  }
}
