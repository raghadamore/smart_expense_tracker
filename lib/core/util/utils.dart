import 'package:flutter/material.dart';

double screenWidth(double percent, BuildContext context) {

  if (MediaQuery.of(context).orientation==Orientation.portrait)
    return MediaQuery.of(context).size.width/ percent;
  else
    return MediaQuery.of(context).size.height/ percent;
}


double screenHeight(double percent, BuildContext context) {

  if (MediaQuery.of(context).orientation==Orientation.portrait)
    return MediaQuery.of(context).size.height/ percent;
  else
    return MediaQuery.of(context).size.width/ percent;
}
