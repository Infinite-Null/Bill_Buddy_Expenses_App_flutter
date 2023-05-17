import 'package:dotted_border/dotted_border.dart';
import 'package:expense/Data/Data.dart';
import 'package:expense/style/EachPerson.dart';
import 'package:expense/style/SmallButton.dart';
import 'package:expense/style/StylishContainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'EachPageDetail/EachTransectionDetail.dart';
import 'InputStyles/PersonInput.dart';
import 'Pages/PersonsPage/MainPage.dart';

class Persons extends StatefulWidget {
  const Persons({super.key});

  @override
  State<Persons> createState() => _PersonsState();
}

class _PersonsState extends State<Persons> {
  Controller a = Get.put(Controller());

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
              Text("Persons"),
              Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return PersonInput();
                            });
                      },
                      child: SmallButton(
                          "+ Add Person", Color.fromARGB(255, 88, 206, 92))),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return MainPersonPage();
                        }));
                      },
                      child: SmallButton(
                          "View all", Color.fromARGB(255, 61, 128, 253))),
                ],
              )
            ],
          ),
          Expanded(child: Obx(() {
            if (a.persons.length == 0) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return PersonInput();
                      });
                },
                child: Container(
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.all(10),
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
                              child: Lottie.asset("./assets/emptyPerson.json",
                                  frameRate: FrameRate(60), height: 200),
                            ),
                            Center(
                                child: Text(
                              "+ Add Person",
                              style: TextStyle(fontSize: 15),
                            ))
                          ],
                        )),
                  ),
                ),
              );
            } else {
              return Obx(() {
                return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: a.persons.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Get.to(() => EachPersonTransectionDetail(
                                index, a.persons[index]["name"]));
                          },
                          child: Obx(
                            () => EachPerson(
                                a.persons[index]["name"],
                                a.persons[index]["Transections"].length,
                                a.persons[index]["oweAmount"],
                                a.persons[index]["recieveAmount"],
                                index,
                                false),
                          ));
                    });
              });
            }
          }))
        ],
      ),
      (height >= 800)
          ? height / 2.555
          : (height >= 730)
              ? height / 2.3
              : (height >= 620)
                  ? height / 1.9
                  : height / 1.7,
      width,
    );
  }
}
