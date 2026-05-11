import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/expenses/expenses_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/add_page/loading_widget.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(3, context),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<ExpensesBloc, ExpensesState>(
        builder: (context, state) {
          if (state is LoadingExpensesState) {
            return const LoadingWidget();
          }
          if (state is ErrorExpensesState) {
            return Text(state.message);
          }
          if (state is LoadedExpensesState) {
            final expenses = state.expenses;
            final weeklyData = calculateWeeklyData(expenses, context);
            return SizedBox(
              height: screenHeight(3, context),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) => Text(
                            ['M', 'T', 'W', 'T', 'F', 'S', 'S'][value.toInt()]),
                      ),
                    ),
                    leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: weeklyData,
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  List<BarChartGroupData> calculateWeeklyData(
      List<Expense> expenses, BuildContext context) {
    List<double> weekTotals = List.filled(7, 0);

    DateTime now = DateTime.now();

    DateTime startOfWeek = now.subtract(
      Duration(days: now.weekday - 1),
    );

    for (var expense in expenses) {
      DateTime expenseDate = DateTime.parse(expense.date);

      if (expenseDate.isAfter(
        startOfWeek.subtract(
          const Duration(days: 1),
        ),
      )) {
        int index = expenseDate.weekday - 1;

        weekTotals[index] += expense.amount;
      }
    }

    return List.generate(7, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: weekTotals[index],
            width: screenWidth(22, context),
            borderRadius: BorderRadius.circular(6),
          ),
        ],
      );
    });
  }
}
