import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:expense/Data/ExpensesData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ExpensesInput extends StatefulWidget {
  const ExpensesInput({super.key});

  @override
  State<ExpensesInput> createState() => _ExpensesInputState();
}

class _ExpensesInputState extends State<ExpensesInput> {
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  var selected = "Food".obs;
  ExpensesData a = Get.put(ExpensesData());
  List<String> items = [
    "Food",
    "Housing",
    "Transport",
    "Utilities",
    "Clothing",
    "Medical",
    "Bills",
    "Shoping",
    "Others",
  ];
  var selectedDate = DateTime.now().obs;
  void showDate(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20,
                ),
                height: 200,
                child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    maximumDate: DateTime(DateTime.now().year + 1),
                    dateOrder: DatePickerDateOrder.dmy,
                    mode: CupertinoDatePickerMode.date,
                    backgroundColor: Colors.white,
                    onDateTimeChanged: (date) {
                      selectedDate.value = date;
                    }),
              ),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 20,
                ),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SimpleBtn2(
                      text: "Done",
                      onPressed: () {
                        Navigator.pop(context);
                        print(selectedDate.value);
                      },
                    ),
                    SimpleBtn2(
                      invertedColors: true,
                      text: "Cancel",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 1,
      child: SizedBox(
        height: 420,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Enter the name of expense: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: name,
                cursorColor: Colors.black,
                style: GoogleFonts.cabin(),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.e_mobiledata),
                    suffixIcon: IconButton(
                        onPressed: () {
                          name.clear();
                        },
                        icon: Icon(Icons.clear)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Enter the amount: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: amount,
                cursorColor: Colors.black,
                style: GoogleFonts.cabin(),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.money),
                    suffixIcon: IconButton(
                        onPressed: () {
                          amount.clear();
                        },
                        icon: Icon(Icons.clear)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
            ),
            //-------------------------------------------xxx------------------------
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(5),
                width: 220,
                child: Obx(
                  () => DropdownButtonFormField2(
                      isDense: true,
                      isExpanded: true,
                      buttonStyleData: ButtonStyleData(
                        elevation: 20,
                      ),
                      dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          scrollbarTheme: ScrollbarThemeData(),
                          elevation: 20,
                          scrollPadding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black,
                              )),
                          padding: EdgeInsets.symmetric(horizontal: 0)),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(18)),
                        prefixText: "  Select type",
                        //Add isDense true and zero Padding.
                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        //Add more decoration as you want here
                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                      ),
                      onChanged: (val) {
                        selected.value = val.toString();
                      },
                      value: selected.value,
                      items: items
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList()),
                ),
              ),
            ),
            //-----------------------------------xxxxx-------------------------------
            Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(5),
                width: 220,
                child: GestureDetector(
                  onTap: () {
                    showDate(context);
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: 110,
                      alignment: Alignment.center,
                      child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 131, 131, 131)),
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            children: [
                              Text(
                                "Select date          ",
                                style: TextStyle(fontSize: 15),
                              ),
                              Obx(
                                () => Text(
                                  DateFormat.MMMd().format(selectedDate.value),
                                  style: GoogleFonts.cabin(
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ],
                          ))),
                ),
              ),
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
                    text: "Add",
                    onPressed: () {
                      if (amount.text == '' || name.text == '') {
                        Get.snackbar("Fill all the fields",
                            "Please fill amount and name",
                            animationDuration: Duration(milliseconds: 200),
                            duration: Duration(milliseconds: 1100));
                      } else {
                        a.addExpense(name.text, double.parse(amount.text),
                            selected.value, selectedDate.value.toString());
                        Navigator.pop(context);
                      }
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
  final primaryColor = Color.fromARGB(255, 33, 185, 33);
  final accentColor = Color.fromARGB(255, 252, 252, 252);

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

class SimpleBtn2 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;
  SimpleBtn2(
      {required this.text,
      required this.onPressed,
      this.invertedColors = false,
      Key? key})
      : super(key: key);
  final primaryColor = Color.fromARGB(255, 185, 114, 33);
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
