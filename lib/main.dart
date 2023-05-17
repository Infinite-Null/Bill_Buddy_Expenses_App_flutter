// ignore_for_file: deprecated_member_use

import 'package:expense/Data/Data.dart';
import 'package:expense/Data/ExpensesData.dart';
import 'package:expense/Data/SubscriptionDate.dart';
import 'package:expense/Data/systemData.dart';
import 'package:expense/LandingPage/MainPageLanding.dart';
import 'package:expense/Pages/AboutPage.dart';
import 'package:expense/persons.dart';
import 'package:expense/settings%20page/MainSettingsPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'Expenses.dart';
import 'Subscription.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init("Box");
  Controller a = Get.put(Controller());
  ExpensesData b = Get.put(ExpensesData());
  SubscriptionData c = Get.put(SubscriptionData());
  SystemData d = Get.put(SystemData());
  a.readData();
  b.readData();
  c.readData();
  d.retrive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  SystemData d = Get.put(SystemData());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bill Buddy',
      theme: ThemeData(
          dialogTheme: const DialogTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)))),
          textTheme: TextTheme(
            headline1: GoogleFonts.roboto(
              fontSize: 25.0,
            ),
            headline6: GoogleFonts.cabin(
              fontSize: 15.0,
            ),
            headline2: GoogleFonts.satisfy(fontSize: 20),
            bodyText2: GoogleFonts.cabin(
              fontSize: 25.0,
            ),
          ),
          useMaterial3: true,
          primaryColor: Color(0xff4338CA),
          scaffoldBackgroundColor: Colors.white),
      // home: MyHomePage(),
      home: d.isIn.value ? MyHomePage() : MainPageLanding(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var page = 0.obs;
  SystemData data = Get.put(SystemData());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          elevation: 0,
          title: Obx(() {
            if (page == 0) {
              return Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hello ",
                        style: GoogleFonts.cabin(
                          fontSize: 33.0,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xff4338CA)),
                        ),
                        child: Obx(() => Text(
                              (data.name.value.indexOf(" ") != -1)
                                  ? data.name.value.substring(
                                      0, data.name.value.indexOf(" "))
                                  : data.name.value,
                              style: GoogleFonts.roboto(
                                  fontSize: 22,
                                  color: Color(0xff4338CA),
                                  fontWeight: FontWeight.w300),
                            )),
                      )
                    ],
                  ),
                ],
              );
            } else if (page == 1) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hello",
                        style: GoogleFonts.cabin(
                          fontSize: 40.0,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return Container();
            }
          })),
      body: BottomBar(
        barColor: Color.fromARGB(134, 8, 8, 8),
        borderRadius: BorderRadius.circular(25),
        width: width - 100,
        bottom: 5,
        child: GNav(
          color: Color.fromARGB(255, 255, 255, 255),
          activeColor: Color.fromARGB(255, 253, 253, 253),
          tabBackgroundColor: Color.fromARGB(255, 93, 152, 240),
          // tabActiveBorder:
          //     Border.all(color: Color.fromARGB(255, 255, 255, 255)),

          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          gap: 10,
          textStyle: GoogleFonts.cabin(
            fontSize: 15,
            color: Color.fromARGB(255, 251, 252, 253),
          ),
          onTabChange: (x) {
            page.value = x;
          },
          tabBorderRadius: 16,
          duration: Duration(milliseconds: 200),
          tabMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: "Home",
            ),
            GButton(
              icon: Icons.menu,
              text: "Menu",
            ),
            GButton(
              icon: Icons.person,
              text: "About",
            ),
          ],
        ),
        // child: BottomNavigationBar(items: [
        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        // ]),
        body: (context, controller) {
          return Obx(() {
            if (page.value == 0) {
              return ListView(
                controller: controller,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [Persons(), Expenses(), Subscription()],
              );
            } else if (page.value == 1) {
              return ListView(
                children: [AboutPage()],
              );
            } else {
              return MainSettingsPage();
            }
          });
        },
      ),
    );
  }
}



//==============Main Page=============
// (context, controller) =>, 