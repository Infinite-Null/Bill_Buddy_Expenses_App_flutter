import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class EachAvatar extends StatelessWidget {
  EachAvatar(this.link);
  String link;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LottieBuilder.asset(
        link,
        height: 150,
        width: 150,
      ),
    );
  }
}
