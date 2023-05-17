import 'package:expense/Data/systemData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'EachButtonAbout.dart';
import 'ExpensesPage/MainExpensePage.dart';
import 'PersonsPage/MainPage.dart';
import 'SubscriptionPage/MainSubsPage.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    SystemData data = Get.put(SystemData());
    return Container(
        height: height / 1.2,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    (data.name.value.indexOf(" ") != -1)
                        ? data.name.value
                            .substring(0, data.name.value.indexOf(" "))
                        : data.name.value,
                    style: GoogleFonts.roboto(
                        fontSize: 22,
                        color: Color(0xff4338CA),
                        fontWeight: FontWeight.w300),
                  ),
                ),
                Spacer(),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: height / 2,
                  margin: EdgeInsets.all(35),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(96, 0, 0, 0),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(5, 5))
                    ],
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 139, 216, 252),
                      Color.fromARGB(255, 75, 149, 247)
                    ]),
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 92,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return MainPersonPage();
                            }));
                          },
                          child: AboutButton("Person", "cont1")),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return MainExpensePage();
                            }));
                          },
                          child: AboutButton("Expenses", "cont2")),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return MainSubspage();
                            }));
                          },
                          child: AboutButton("Subscription", "cont3"))
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: height,
              child: Container(
                  alignment: Alignment.topCenter,
                  height: height / 1.5,
                  margin: EdgeInsets.all(25),
                  child: Obx(() {
                    if (data.gender == "Male") {
                      return Lottie.asset("./assets/male1.json", height: 150);
                    } else {
                      return Lottie.asset("./assets/female1.json", height: 150);
                    }
                  })),
            )
          ],
        ));
  }
}
