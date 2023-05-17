import 'package:dotted_border/dotted_border.dart';
import 'package:expense/style/EachExpenses.dart';
import 'package:expense/style/SmallButton.dart';
import 'package:expense/style/StylishContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'Data/ExpensesData.dart';
import 'InputStyles/AddExpenses.dart';
import 'Pages/ExpensesPage/MainExpensePage.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  ExpensesData a = Get.put(ExpensesData());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return StylishContainer(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Expenses"),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ExpensesInput();
                          });
                    },
                    child: SmallButton(
                        "+ Add Expenses", Color.fromARGB(255, 88, 206, 92)),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return MainExpensePage();
                        }));
                      },
                      child: SmallButton(
                          "View all", Color.fromARGB(255, 61, 128, 253))),
                ],
              )
            ],
          ),
          Expanded(child: Obx(() {
            if (a.expenses.length == 0) {
              return GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ExpensesInput();
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DottedBorder(
                        radius: Radius.circular(15),
                        color: Colors.black,
                        borderType: BorderType.RRect,
                        strokeWidth: 1,
                        dashPattern: [
                          5,
                          5,
                        ],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Lottie.asset("./assets/emptyExpense.json",
                                  frameRate: FrameRate(60), height: 200),
                            ),
                            Center(
                                child: Text(
                              "+ Add Expense",
                              style: TextStyle(fontSize: 15),
                            ))
                          ],
                        )),
                  ));
            } else {
              return ListView.builder(
                  padding: EdgeInsets.all(5),
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: a.expenses.length,
                  itemBuilder: (context, index) {
                    return EachExpenses(
                      name: a.expenses[index]["name"],
                      amount: a.expenses[index]["amount"],
                      date: DateTime.parse(a.expenses[index]["date"]),
                      index: index,
                      type: a.expenses[index]["type"],
                      isAbout: false,
                    );
                  });
            }
          })
              //     child: ListView(

              //   children: [
              //     EachExpenses(name: "Shoe", amount: 10000, date: DateTime.now()),
              //     EachExpenses(name: "Shoe", amount: 500, date: DateTime.now()),
              //     EachExpenses(name: "Shoe", amount: 60, date: DateTime.now()),
              //   ],
              // )

              )
        ],
      ),
      (height >= 800)
          ? height / 3
          : (height >= 730)
              ? height / 2.5
              : (height >= 620)
                  ? height / 2.3
                  : height / 1.7,
      width,
    );
  }
}
