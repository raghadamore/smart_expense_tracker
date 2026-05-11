import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';

class NavIconWidget extends StatelessWidget {
final  IconData icon; 
final String label;
final  bool isActive;
  const NavIconWidget({super.key, required this.icon, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? Colors.blue : Colors.grey),
          Text(label, style: TextStyle(color: isActive ? Colors.blue : Colors.grey, fontSize: screenWidth(40, context))),
        ],
      ),
    );
  }
}