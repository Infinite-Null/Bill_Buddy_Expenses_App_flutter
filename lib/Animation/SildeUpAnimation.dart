import 'package:flutter/material.dart';

class SlideUpAnimation extends StatelessWidget {
  double start;
  Widget wid;
  int duration;
  double g(val) {
    double y;
    y = (val / start) - 1;
    if (y < 0) {
      y = -1 * y;
    }
    return y;
  }

  SlideUpAnimation(
      {required this.wid, required this.start, required this.duration});
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: start, end: 0.0),
        duration: Duration(milliseconds: duration),
        builder: (context, val, _) {
          return AnimatedOpacity(
              opacity: g(val),
              duration: Duration(milliseconds: 350),
              child: AnimatedSlide(
                  offset: Offset(0, val),
                  duration: Duration(milliseconds: 350),
                  child: wid));
        });
  }
}
