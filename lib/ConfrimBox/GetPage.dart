// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class GetPageDetail extends StatefulWidget {
  GetPageDetail(this.amount, this.name);
  double amount;
  String name;

  @override
  State<GetPageDetail> createState() => _GetPageDetailState(amount, name);
}

class _GetPageDetailState extends State<GetPageDetail>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  _GetPageDetailState(this.amount, this.name);
  double amount;
  String name;
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
        color: Color.fromARGB(255, 93, 181, 93),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/Profit.json',
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
            Text("You will recieve"),
            Text(
              NumberFormat.simpleCurrency(locale: 'hi-IN', decimalDigits: 1)
                  .format(amount),
              style: GoogleFonts.cabin(
                fontSize: 45,
              ),
            ),
            Text(
              "From " + name,
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




// class GetPageDetail extends StatelessWidget {
//   GetPageDetail(this.amount, this.name);
//   double amount;
//   String name;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         color: Color.fromARGB(255, 93, 181, 93),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 300,
//               width: 300,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("./assets/recieve.gif"))),
//             ),
//             Text("You will recieve"),
//             Text(
//               NumberFormat.simpleCurrency(locale: 'hi-IN', decimalDigits: 1)
//                   .format(amount),
//               style: GoogleFonts.cabin(
//                 fontSize: 45,
//               ),
//             ),
//             Text(
//               "From " + name,
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