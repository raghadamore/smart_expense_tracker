import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';

class TopHeaderWidget extends StatelessWidget {
  const TopHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: screenWidth(10, context),
          left: screenWidth(40, context),
          right: screenWidth(40, context),
          bottom: screenWidth(20, context)),
      decoration: const BoxDecoration(color: Color(0xFF1D2633)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20),
          Text(
            "Statistics",
            style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth(25, context),
                fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text("This Month",
                style: TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}
