// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class GivePageDetail extends StatefulWidget {
  GivePageDetail(this.amount, this.name);
  double amount;
  String name;

  @override
  State<GivePageDetail> createState() => _GivePageDetailState(amount, name);
}

class _GivePageDetailState extends State<GivePageDetail>
    with TickerProviderStateMixin {
  _GivePageDetailState(this.amount, this.name);
  double amount;
  String name;
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color.fromARGB(255, 253, 113, 154),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/loss.json',
              height: 350,
              frameRate: FrameRate(60),
              animate: true,
              options: LottieOptions(enableMergePaths: true),
              repeat: true,
              controller: _controller,
              onLoaded: (composition) {
                // Configure the AnimationController with the duration of the
                // Lottie file and start the animation.
                _controller
                  ..duration = composition.duration
                  ..forward();
              },
            ),
            Text("You will give"),
            Text(
              NumberFormat.simpleCurrency(locale: 'hi-IN', decimalDigits: 1)
                  .format(double.parse(amount.toString().replaceAll("-", ""))),
              style: GoogleFonts.cabin(
                fontSize: 45,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              "to " + name,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: 100,
              child: OutlinedButton(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(BorderSide(
                          color: Color.fromARGB(155, 255, 255, 255))),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Okey",
                    style: GoogleFonts.cabin(
                        fontSize: 20,
                        color: Color.fromARGB(204, 255, 255, 255)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
// class GivePageDetail extends StatelessWidget {
//   GivePageDetail(this.amount, this.name);
//   double amount;
//   String name;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         color: Color.fromARGB(255, 253, 113, 154),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 300,
//               width: 300,
//               decoration: BoxDecoration(
//                   image:
//                       DecorationImage(image: AssetImage("./assets/give.gif"))),
//             ),
//             Text("You will give"),
//             Text(
//               NumberFormat.simpleCurrency(locale: 'hi-IN', decimalDigits: 1)
//                   .format(double.parse(amount.toString().replaceAll("-", ""))),
//               style: GoogleFonts.cabin(
//                 fontSize: 45,
//               ),
//             ),
//             Text(
//               textAlign: TextAlign.center,
//               "to " + name,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               height: 50,
//               width: 100,
//               child: OutlinedButton(
//                   style: ButtonStyle(
//                       side: MaterialStateProperty.all(BorderSide(
//                           color: Color.fromARGB(155, 255, 255, 255))),
//                       padding: MaterialStateProperty.all(EdgeInsets.all(10))),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     "Okey",
//                     style: GoogleFonts.cabin(
//                         fontSize: 20,
//                         color: Color.fromARGB(204, 255, 255, 255)),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
