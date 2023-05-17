import 'package:auto_size_text/auto_size_text.dart';
import 'package:expense/Data/systemData.dart';
import 'package:expense/settings%20page/EditPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'DetailsOfProfile.dart';

class MainSettingsPage extends StatefulWidget {
  const MainSettingsPage({super.key});

  @override
  State<MainSettingsPage> createState() => _MainSettingsPageState();
}

class _MainSettingsPageState extends State<MainSettingsPage> {
  SystemData data = Get.put(SystemData());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Profile",
                  style: GoogleFonts.roboto(
                      color: Color.fromARGB(255, 33, 82, 243),
                      fontSize: 50,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  Obx(
                    () => (data.gender.value == "Male")
                        ? Lottie.asset("./assets/male1.json",
                            height: MediaQuery.of(context).size.height / 7,
                            frameRate: FrameRate(60))
                        : Lottie.asset("./assets/female1.json",
                            height: 150, frameRate: FrameRate(60)),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Obx(
                            () => AutoSizeText(
                              maxLines: 2,
                              data.name.value.toString(),
                              style: GoogleFonts.roboto(
                                  fontSize: 55,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blue,
                            ),
                            child: Obx(
                              () => Text(
                                data.gender.value.toString(),
                                style: GoogleFonts.cabin(
                                    fontSize: 20, color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context, builder: ((context) => EditPage()));
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Edit "),
                    Icon(
                      Icons.edit,
                      size: 15,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "Details",
                  style: GoogleFonts.roboto(
                      color: Color.fromARGB(255, 33, 82, 243),
                      fontSize: 50,
                      fontWeight: FontWeight.w200),
                ),
              ),
            ),
            DetailsPageOfProfile(),
          ],
        ),
      ),
    );
  }
}
