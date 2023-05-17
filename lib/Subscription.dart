import 'package:dotted_border/dotted_border.dart';
import 'package:expense/Data/SubscriptionDate.dart';
import 'package:expense/InputStyles/AddSubscription.dart';
import 'package:expense/style/EachSubscription.dart';
import 'package:expense/style/SmallButton.dart';
import 'package:expense/style/StylishContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'Pages/SubscriptionPage/MainSubsPage.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  SubscriptionData a = Get.put(SubscriptionData());
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
              Text("Subscription"),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SubscriptionAdd();
                            });
                      },
                      child: SmallButton(
                          "+ Add Sub", Color.fromARGB(255, 88, 206, 92))),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return MainSubspage();
                        }));
                      },
                      child: SmallButton(
                          "View all", Color.fromARGB(255, 61, 128, 253))),
                ],
              )
            ],
          ),
          Expanded(child: Obx(() {
            if (a.subscriptions.length == 0) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SubscriptionAdd();
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                            child: Lottie.asset("./assets/emptySubs.json",
                                frameRate: FrameRate(60), height: 150),
                          ),
                          Center(
                              child: Text(
                            "+ Add Subscription",
                            style: TextStyle(fontSize: 15),
                          ))
                        ],
                      )),
                ),
              );
            } else {
              return Obx(() => ListView.builder(
                    itemCount: a.subscriptions.length,
                    itemBuilder: (context, index) {
                      return EachSubscrtption(
                          a.subscriptions[index]["name"],
                          a.subscriptions[index]["amount"],
                          DateTime.parse(a.subscriptions[index]["from"]),
                          DateTime.parse(a.subscriptions[index]["to"]),
                          index,
                          false);
                    },
                    padding: EdgeInsets.all(5),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                  ));
            }
          }))
        ],
      ),
      height / 3,
      width,
    );
  }
}
              // EachSubscrtption(
              //   "Netflix",
              //   500,
              //   DateTime.now(),
              //   DateTime.now(),
              // ),
              // EachSubscrtption(
              //   "Amazon",
              //   500,
              //   DateTime.now(),
              //   DateTime.now(),
              // ),
              // EachSubscrtption(
              //   "Diseny",
              //   500,
              //   DateTime.now(),
              //   DateTime.now(),
              // ),
              // EachSubscrtption(
              //   "Aws",
              //   500,
              //   DateTime.now(),
              //   DateTime.now(),
              // ),
              // EachSubscrtption(
              //   "Cloud",
              //   500,
              //   DateTime.now(),
              //   DateTime.now(),
              // ),
              // EachSubscrtption(
              //   "Photo",
              //   500,
              //   DateTime.now(),
              //   DateTime.now(),
              // ),
              // EachSubscrtption(
              //   "Rain",
              //   500,
              //   DateTime.now(),
              //   DateTime.now(),
              // ),