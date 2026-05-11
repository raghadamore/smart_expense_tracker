import 'package:flutter/material.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/state_page/bar_chart_widget.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/state_page/pie_chart_widget.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/state_page/top_header_widget.dart'; // مكتبة الرسوم البيانية

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F9),
      body: Column(
        children: [
          const TopHeaderWidget(),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(screenWidth(20, context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PieChartWidget(),
                  SizedBox(height: screenHeight(50, context)),
                  Text(
                    "Expense Trends",
                    style: TextStyle(
                        fontSize: screenWidth(26, context),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: screenHeight(70, context)),
                  const BarChartWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
