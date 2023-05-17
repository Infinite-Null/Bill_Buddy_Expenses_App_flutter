import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Data/SubscriptionDate.dart';
import '../../InputStyles/AddSubscription.dart';
import '../../style/EachSubscription.dart';
import '../PersonsPage/AppBar.dart';

class MainSubspage extends StatefulWidget {
  const MainSubspage({super.key});

  @override
  State<MainSubspage> createState() => _MainSubspageState();
}

class _MainSubspageState extends State<MainSubspage> {
  SubscriptionData a = Get.put(SubscriptionData());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            child: AppBarPerson(
                title: "Subscriptions",
                button: "+Add Subs",
                fun: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SubscriptionAdd();
                      });
                }),
            preferredSize: Size.fromHeight(130)),
      ),
      body: Hero(
          tag: 'cont3',
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
              if (a.subscriptions.length != 0) {
                return ListView.builder(
                  itemCount: a.subscriptions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: EachSubscrtption(
                          a.subscriptions[index]["name"],
                          a.subscriptions[index]["amount"],
                          DateTime.parse(a.subscriptions[index]["from"]),
                          DateTime.parse(a.subscriptions[index]["to"]),
                          index,
                          true),
                    );
                  },
                  padding: EdgeInsets.all(5),
                  physics: BouncingScrollPhysics(),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.asset("./assets/emptySubs.json",
                          frameRate: FrameRate(60), height: 150),
                    ),
                    Center(
                        child: Text(
                      "+ Add Subscription",
                      style: Theme.of(context).textTheme.headline6,
                    ))
                  ],
                );
              }
            }),
          )),
    );
  }
}
