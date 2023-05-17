import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../Data/Data.dart';
import '../../EachPageDetail/EachTransectionDetail.dart';
import '../../InputStyles/PersonInput.dart';
import '../../style/EachPerson.dart';
import 'AppBar.dart';

class MainPersonPage extends StatefulWidget {
  const MainPersonPage({super.key});

  @override
  State<MainPersonPage> createState() => _MainPersonPageState();
}

class _MainPersonPageState extends State<MainPersonPage> {
  Controller a = Get.put(Controller());
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
                title: "Persons",
                button: "+Add Person",
                fun: () {
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return PersonInput();
                      });
                }),
            preferredSize: Size.fromHeight(130)),
      ),
      body: Hero(
        tag: "cont1",
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
              if (a.persons.length == 0) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return PersonInput();
                        });
                  },
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
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w100),
                      ))
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                    padding: EdgeInsets.all(0),
                    physics: BouncingScrollPhysics(),
                    itemCount: a.persons.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => EachPersonTransectionDetail(
                              index, a.persons[index]["name"]));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: EachPerson(
                              a.persons[index]["name"],
                              a.persons[index]["Transections"].length,
                              a.persons[index]["oweAmount"],
                              a.persons[index]["recieveAmount"],
                              index,
                              true),
                        ),
                      );
                    });
              }
            })),
      ),
    );
  }
}
