import 'package:expense/Data/systemData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:crea_radio_button/crea_radio_button.dart';

class Page2 extends StatelessWidget {
  SystemData a = Get.put(SystemData());

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 255, 188, 149),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset("./assets/pag2.json",
              height: 300, frameRate: FrameRate(60)),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(textAlign: TextAlign.center, "Select Your Gender"),
          ),
          RadioButtonGroup(
              textStyle: TextStyle(color: Colors.black),
              buttonHeight: 35,
              buttonWidth: 100,
              preSelectedIdx: a.selected.value,
              mainAxisAlignment: MainAxisAlignment.center,
              spaceBetween: 10,
              selectedBorderSide:
                  BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              circular: true,
              mainColor: Color.fromARGB(255, 255, 188, 149),
              selectedColor: Color.fromARGB(255, 255, 188, 149),
              options: [
                RadioOption("Male", "Male"),
                RadioOption("Female", "Female"),
              ],
              callback: (RadioOption val) {
                a.gender.value = val.value;
                if (val.value == "Male") {
                  a.selected.value = 0;
                } else {
                  a.selected.value = 1;
                }
                print(a.gender.value);
              })
        ]));
  }
}
