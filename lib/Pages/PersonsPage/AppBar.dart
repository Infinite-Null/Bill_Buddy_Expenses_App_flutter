import 'package:expense/Animation/SildeUpAnimation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarPerson extends StatelessWidget {
  String title, button;
  final VoidCallback fun;
  AppBarPerson({required this.title, required this.button, required this.fun});
  double x(val) {
    double y;
    y = (val / 0.4) - 1;
    if (y < 0) {
      y = -1 * y;
    }
    return y;
  }

  double g(val) {
    double y;
    y = (val / 0.2) - 1;
    if (y < 0) {
      y = -1 * y;
    }
    return y;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SlideUpAnimation(
              wid: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 36,
                height: 50,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 40, fontWeight: FontWeight.w100),
                ),
              ),
              start: 0.7,
              duration: 200,
            ),
            SizedBox(
              height: 20,
            ),
            SlideUpAnimation(
                wid: GestureDetector(
                  onTap: fun,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      button,
                      style:
                          GoogleFonts.cabin(color: Colors.purple, fontSize: 15),
                    ),
                  ),
                ),
                start: 0.4,
                duration: 210)
          ],
        ),
      ),
    );
  }
}
