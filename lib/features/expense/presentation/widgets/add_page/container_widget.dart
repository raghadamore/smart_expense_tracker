import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';

class ContainerWidgets extends StatelessWidget {
  final Widget child;
  const ContainerWidgets({required this.child,super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return  Container(
                      margin: EdgeInsets.symmetric(horizontal:  screenWidth(200, context),vertical: screenWidth(60, context)),
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:const Color.fromARGB(235, 234, 231, 231)),
                     height: screenHeight(12, context),
                      child: child
                    );
  }
}