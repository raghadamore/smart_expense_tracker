import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key,required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: screenWidth(30, context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}
  
