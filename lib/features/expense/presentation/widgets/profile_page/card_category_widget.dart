import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';

class CardCategoryWidget extends StatelessWidget {
  final Expense data;
  const CardCategoryWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final icons = {
      "Food": Icons.restaurant,
      "Transport": Icons.directions_car,
      "Shopping": Icons.shopping_bag,
      "Bills": Icons.receipt_long,
    };
    final colorsIcon = {
      "Food": Colors.orange,
      "Transport": Colors.grey,
      "Shopping": Colors.orange,
      "Bills": Colors.blue,
    };
    return Container(
      margin: EdgeInsets.only(bottom: screenWidth(20, context)),
      padding: EdgeInsets.all(screenWidth(25, context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(screenWidth(30, context)),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F6F9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icons[data.category],
                size: screenWidth(20, context),
                color: colorsIcon[data.category]),
          ),
          SizedBox(width: screenWidth(25, context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.category,
                  style: TextStyle(
                      fontSize: screenWidth(22, context),
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1D2633)),
                ),
                SizedBox(height: screenHeight(120, context)),
                Text(
                  "\$${data.amount}",
                  style: TextStyle(
                      color: Colors.grey, fontSize: screenWidth(26, context)),
                ),
              ],
            ),
          ),
          Text(
            "\$${data.amount}",
            style: TextStyle(
                fontSize: screenWidth(20, context),
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1D2633)),
          ),
        ],
      ),
    );
  }
}
