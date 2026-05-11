import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';

class TransactionsItemWidget extends StatelessWidget {
final  IconData icon;
 final  String title; 
final   String date;
 final   String amount; 
   final Color iconColor;
  const TransactionsItemWidget({super.key, required this.icon, required this.title, required this.date, required this.amount, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: iconColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(date),
      trailing: Text(amount, style:  TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth(28, context))),
    );
  }
}