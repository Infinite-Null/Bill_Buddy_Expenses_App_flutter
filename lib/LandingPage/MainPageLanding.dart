import 'package:expense/Data/systemData.dart';
import 'package:expense/LandingPage/Page3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../main.dart';
import 'Page1.dart';
import 'Page2.dart';

TextEditingController input = TextEditingController();

class MainPageLanding extends StatefulWidget {
  const MainPageLanding({super.key});

  @override
  State<MainPageLanding> createState() => _MainPageLandingState();
}

class _MainPageLandingState extends State<MainPageLanding> {
  LiquidController controller = LiquidController();
  SystemData data = Get.put(SystemData());
  var pagei = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          LiquidSwipe(
              onPageChangeCallback: (activePageIndex) {
                pagei.value = activePageIndex;
              },
              enableLoop: false,
              enableSideReveal: true,
              liquidController: controller,
              slideIconWidget: Icon(
                Icons.arrow_back_ios,
                size: 30,
              ),
              waveType: WaveType.liquidReveal,
              fullTransitionValue: 300,
              pages: [Page1(), Page2(), Page3()]),
          Positioned(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() {
                    if (pagei != 0) {
                      return GestureDetector(
                        onTap: () {
                          final page = controller.currentPage - 1;
                          pagei.value = page;
                          if (page >= 0) {
                            controller.jumpToPage(page: page);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(12),
                          height: 60,
                          width: 60,
                          child: Icon(Icons.arrow_left_outlined, size: 30),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      );
                    } else {
                      return SizedBox(
                        width: 60,
                      );
                    }
                  }),
                  Obx(() {
                    if (pagei.value == 2) {
                      return GestureDetector(
                        onTap: () {
                          if (input.text == '') {
                            Get.snackbar("Please fill Your Name", "");
                          } else {
                            data.name.value = input.text;
                            data.isIn.value = true;
                            data.saveData();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage()));
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Lets Save!",
                            style: TextStyle(fontSize: 20),
                          ),
                          margin: EdgeInsets.all(12),
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          final page = controller.currentPage + 1;
                          pagei.value = page;
                          controller.animateToPage(
                              page: page > 3 ? 0 : page, duration: 500);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(12),
                          height: 60,
                          width: 60,
                          child: Icon(Icons.arrow_right_outlined),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      );
                    }
                  })
                ],
              ),
            ),
            bottom: 0,
          )
        ],
      ),
    );
  }
}
