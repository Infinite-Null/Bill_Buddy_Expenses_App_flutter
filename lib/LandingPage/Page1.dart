import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 253, 236, 188),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Lottie.asset("./assets/page1.json",
              height: 200, frameRate: FrameRate(60)),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
                textAlign: TextAlign.center,
                "A useful app to \ntake control of your finances and better manage your expenses."),
          )
        ]));
  }
}
