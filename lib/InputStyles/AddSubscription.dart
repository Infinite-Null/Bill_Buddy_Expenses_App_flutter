import 'package:expense/Data/SubscriptionDate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SubscriptionAdd extends StatefulWidget {
  const SubscriptionAdd({super.key});

  @override
  State<SubscriptionAdd> createState() => _SubscriptionAddState();
}

class _SubscriptionAddState extends State<SubscriptionAdd> {
  TextEditingController name = TextEditingController();
  TextEditingController amount = TextEditingController();
  var selectedFromDate = DateTime.now().obs;
  var selectedToDate = DateTime.now().obs;
  SubscriptionData a = Get.put(SubscriptionData());
  //-----------------------xxxxxxxxxxx-------------------------

  void showDateFrom(BuildContext context) {
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
                    minimumDate: DateTime(DateTime.now().year - 1),
                    maximumDate: DateTime(DateTime.now().year + 3),
                    dateOrder: DatePickerDateOrder.dmy,
                    mode: CupertinoDatePickerMode.date,
                    backgroundColor: Colors.white,
                    onDateTimeChanged: (date) {
                      selectedFromDate.value = date;
                      selectedToDate.value = date;
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

//-----------------------------------xxxxxxxxxxxxx-----------------------------
  void showDateTo(BuildContext context) {
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
                child: Obx(() => CupertinoDatePicker(
                    initialDateTime: selectedFromDate.value,
                    minimumDate: selectedFromDate.value,
                    maximumDate: DateTime(selectedFromDate.value.year + 20),
                    dateOrder: DatePickerDateOrder.dmy,
                    mode: CupertinoDatePickerMode.date,
                    backgroundColor: Colors.white,
                    onDateTimeChanged: (date) {
                      selectedToDate.value = date;
                    })),
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
        height: 380,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Enter the name of Subscription: ",
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
              child: Text("Enter the Amount: ",
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

            //-----------------------------------xxxxx-------------------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 130,
                    child: GestureDetector(
                      onTap: () {
                        showDateFrom(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 110,
                          alignment: Alignment.center,
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 131, 131, 131)),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  Text(
                                    "From :  ",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Obx(
                                    () => Text(
                                      DateFormat.MMMd()
                                          .format(selectedFromDate.value),
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
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 130,
                    child: GestureDetector(
                      onTap: () {
                        showDateTo(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 110,
                          alignment: Alignment.center,
                          child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          Color.fromARGB(255, 131, 131, 131)),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                children: [
                                  Text(
                                    "To :  ",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Obx(
                                    () => Text(
                                      DateFormat.MMMd()
                                          .format(selectedToDate.value),
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
              ],
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
                      if (name.text == "" || amount.text == "") {
                        Get.snackbar("Fill Fields Properly",
                            "Dont leave any field empty",
                            duration: Duration(milliseconds: 1500),
                            animationDuration: Duration(milliseconds: 300));
                      } else {
                        a.addSubscription(
                            name.text,
                            double.parse(amount.text),
                            selectedFromDate.value.toString(),
                            selectedToDate.value.toString());
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
