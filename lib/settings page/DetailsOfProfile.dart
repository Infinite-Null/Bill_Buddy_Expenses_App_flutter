import 'package:expense/Data/Data.dart';
import 'package:expense/Data/ExpensesData.dart';
import 'package:expense/Data/SubscriptionDate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'TextStyling.dart';

class DetailsPageOfProfile extends StatelessWidget {
  DetailsPageOfProfile({super.key});
  Controller a = Get.put(Controller());
  ExpensesData b = Get.put(ExpensesData());
  SubscriptionData c = Get.put(SubscriptionData());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black)),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              TextStyling("T", "otal", "P", "ersons:"),
              Spacer(),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: Obx(
                    () => Text(
                      a.persons.length.toString(),
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.w300),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextStyling("T", "otal", "E", "xpenses:"),
              Spacer(),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: Obx(
                    () => Text(
                      b.expenses.length.toString(),
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.w300),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextStyling("T", "otal", "S", "ubscription:"),
              Spacer(),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: Obx(
                    () => Text(
                      c.subscriptions.length.toString(),
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.w300),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
