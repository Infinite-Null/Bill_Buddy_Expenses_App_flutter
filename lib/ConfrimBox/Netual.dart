// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Netural extends StatefulWidget {
  Netural(this.name);
  String name;

  @override
  State<Netural> createState() => _NeturalState(name);
}

class _NeturalState extends State<Netural> with TickerProviderStateMixin {
  _NeturalState(this.name);
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
        color: Color.fromARGB(255, 159, 138, 216),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/nothing.json',
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
            Text("You neither give or get"),
            Text(
              textAlign: TextAlign.center,
              "anything from " + name,
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
                          color: Color.fromARGB(255, 255, 255, 255))),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10))),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Okey",
                    style: GoogleFonts.cabin(
                        fontSize: 20,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
// class Netural extends StatelessWidget {
//   Netural(this.name);
//   String name;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         color: Color.fromARGB(255, 159, 138, 216),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 300,
//               width: 300,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("./assets/netural.gif"))),
//             ),
//             Text("You neither give or get"),
//             Text(
//               textAlign: TextAlign.center,
//               "anything from " + name,
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
//                           color: Color.fromARGB(255, 255, 255, 255))),
//                       padding: MaterialStateProperty.all(EdgeInsets.all(10))),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text(
//                     "Okey",
//                     style: GoogleFonts.cabin(
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 255, 255, 255)),
//                   )),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
