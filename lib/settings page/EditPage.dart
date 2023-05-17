import 'package:crea_radio_button/crea_radio_button.dart';
import 'package:expense/Data/systemData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  SystemData data = Get.put(SystemData());
  @override
  Widget build(BuildContext context) {
    name.text = data.name.value.toString();
    return Dialog(
        insetAnimationDuration: Duration(milliseconds: 200),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        clipBehavior: Clip.antiAlias,
        child: Container(
          color: Colors.white,
          height: 350,
          width: 320,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("Name"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                child: TextField(
                  controller: name,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromARGB(155, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(20)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Gender"),
              SizedBox(
                height: 10,
              ),
              RadioButtonGroup(
                  textStyle: TextStyle(color: Colors.black),
                  buttonHeight: 35,
                  buttonWidth: 100,
                  preSelectedIdx: data.selected.value,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spaceBetween: 10,
                  selectedBorderSide:
                      BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                  circular: true,
                  mainColor: Color.fromARGB(255, 255, 255, 255),
                  selectedColor: Color.fromARGB(255, 255, 255, 255),
                  options: [
                    RadioOption("Male", "Male"),
                    RadioOption("Female", "Female"),
                  ],
                  callback: (RadioOption val) {
                    data.gender.value = val.value;
                    if (val.value == "Male") {
                      data.selected.value = 0;
                    } else {
                      data.selected.value = 1;
                    }
                  }),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      height: 49,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.blue)),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      data.name.value = name.text;
                      data.saveData();
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      height: 50,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue),
                      child: Text(
                        "Done",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
