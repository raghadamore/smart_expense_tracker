import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: screenWidth(28, context),
          right: screenWidth(28, context),
          left: screenWidth(28, context)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Cancel",
                style: TextStyle(
                    color: Colors.black, fontSize: screenWidth(22, context)),
              )),
          Text(
            "Add Expense",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth(18, context)),
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Save",
                style: TextStyle(
                    color: Colors.white, fontSize: screenWidth(22, context)),
              ))
        ],
      ),
    );
  }
}
