import 'package:expense/Data/ExpensesData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EachExpenses extends StatelessWidget {
  final String name;
  final double amount;
  final DateTime date;
  final String type;
  final int index;
  final bool isAbout;
  const EachExpenses(
      {required this.name,
      required this.amount,
      required this.date,
      required this.index,
      required this.type,
      required this.isAbout,
      Key? key})
      : super(key: key);
  IconData icon(String typeOf) {
    if (typeOf == "Shoping")
      return LineAwesomeIcons.shopping_cart;
    else if (typeOf == "Housing") {
      return LineAwesomeIcons.home;
    } else if (typeOf == "Transport") {
      return LineAwesomeIcons.subway;
    } else if (typeOf == "Food") {
      return LineAwesomeIcons.utensils;
    } else if (typeOf == "Utilities") {
      return LineAwesomeIcons.shopping_basket;
    } else if (typeOf == "Clothing") {
      return LineAwesomeIcons.t_shirt;
    } else if (typeOf == "Medical") {
      return LineAwesomeIcons.stethoscope;
    } else if (typeOf == "Bills") {
      return LineAwesomeIcons.file_invoice_with_us_dollar;
    } else {
      return LineAwesomeIcons.wallet;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10),
        width: 150,
        height: 160,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(12.5),
          border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(5, 5),
                blurRadius: 8,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.3)),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 84, 144, 255),
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10))),
              child: Text(
                DateFormat.MMMd().format(date),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white,
                      fontSize: 15,
                    ),
              ),
            ),
            Spacer(),
            Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10))),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10000),
                        border: Border.all(color: Colors.black)),
                    child: Icon(
                      icon(type),
                      size: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: FittedBox(
                      child: Text(name,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Color.fromARGB(255, 2, 2, 2),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: FittedBox(
                      child: Text(
                        NumberFormat.simpleCurrency(
                                locale: 'hi-IN', decimalDigits: 1)
                            .format(amount),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Color.fromARGB(255, 2, 2, 2),
                              fontSize: 15,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return DialogFb1(index);
                    });
              },
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.red)),
                child: Text(
                  "Delete",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
//---------------------------------xxxxx---------------------------

class DialogFb1 extends StatelessWidget {
  int i;
  DialogFb1(this.i);
  ExpensesData a = Get.put(ExpensesData());
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
                      a.expenses[i]["name"].toString() +
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
                      a.removeExpense(i);
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
