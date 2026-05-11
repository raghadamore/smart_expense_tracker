import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';

class StartCartWidget extends StatelessWidget {
  final Color? color;
  final String title;
  final String amount;
 const StartCartWidget({super.key,this.color,required this.title,required this.amount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding:  EdgeInsets.all(screenWidth(20, context)),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style:  TextStyle(color: Colors.white70, fontSize: screenWidth(28, context))),
             SizedBox(height: screenHeight(120, context)),
            Text(amount, style:  TextStyle(color: Colors.white, fontSize: screenWidth(25, context), fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
