import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Data/ExpensesData.dart';
import '../../InputStyles/AddExpenses.dart';

import '../../style/EachExpenses.dart';
import '../PersonsPage/AppBar.dart';

class MainExpensePage extends StatefulWidget {
  const MainExpensePage({super.key});

  @override
  State<MainExpensePage> createState() => _MainExpensePageState();
}

class _MainExpensePageState extends State<MainExpensePage> {
  ExpensesData a = Get.put(ExpensesData());
  @override
  Widget build(BuildContext context) {
    print("hi");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: AppBarPerson(
                title: "Expenses",
                button: "+Add Expenses",
                fun: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return ExpensesInput();
                      });
                }),
            preferredSize: Size.fromHeight(130)),
      ),
      body: Hero(
          tag: 'cont2',
          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      spreadRadius: 2,
                      color: Color.fromARGB(57, 0, 0, 0),
                      offset: Offset(2, 4))
                ]),
            height: MediaQuery.of(context).size.height - 130,
            child: Obx(() {
              if (a.expenses.length != 0) {
                return GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: a.expenses.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.72,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return EachExpenses(
                        name: a.expenses[index]["name"],
                        amount: a.expenses[index]["amount"],
                        date: DateTime.parse(a.expenses[index]["date"]),
                        index: index,
                        type: a.expenses[index]["type"],
                        isAbout: true,
                      );
                    });
              } else {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return ExpensesInput();
                        });
                  },
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
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 15),
                      ))
                    ],
                  ),
                );
              }
            }),
          )),
    );
  }
}
