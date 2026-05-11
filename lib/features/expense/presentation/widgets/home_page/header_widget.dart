import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF0D1724),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.search,
              color: Colors.white, size: screenWidth(15, context)),
          Text(
            "Hello, Sarah",
            style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth(18, context),
                fontWeight: FontWeight.bold),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=sarah'),
          ),
        ],
      ),
    );
  }
}
