import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/expenses/expenses_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/add_page/loading_widget.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/state_page/legend_widget.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth(50, context)),
      decoration: BoxDecoration(
        color: const Color(0xFF1D2633),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Spending Breakdown",
              style: TextStyle(
                  color: Colors.white, fontSize: screenWidth(26, context))),
          SizedBox(
            height: screenWidth(50, context),
          ),
          BlocBuilder<ExpensesBloc, ExpensesState>(
            builder: (context, state) {
              if (state is LoadingExpensesState) {
                return const LoadingWidget();
              }
              if (state is ErrorExpensesState) {
                return Text(state.message);
              }
              if (state is LoadedExpensesState) {
                List<Expense> expenses = state.expenses;
                final sections = calculateSectionData(expenses, context);
                return SizedBox(
                    height: screenHeight(2.2, context),
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight(4, context),
                          child: PieChart(
                            PieChartData(
                              sections: sections[0],
                            ),
                          ),
                        ),
                        SizedBox(height: screenWidth(50, context)),
                        LegendWidget(
                          categoryData: sections[1],
                          colors: sections[2],
                          total: sections[3],
                        ),
                      ],
                    ));
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  List<dynamic> calculateSectionData(
      List<Expense> expenses, BuildContext context) {
    Map<String, double> categoryData = {};
    for (var expense in expenses) {
      if (categoryData.containsKey(expense.category)) {
        categoryData[expense.category] =
            categoryData[expense.category]! + expense.amount;
      } else {
        categoryData[expense.category] = expense.amount;
      }
    }
    double amount = categoryData.values
        .fold(0, (previousValue, element) => previousValue + element);

    List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];
    int index = 0;
    final sections = categoryData.entries.map(
      (entry) {
        final section = PieChartSectionData(
            value: entry.value,
            title: (entry.value / amount * 100).toStringAsFixed(1),
            radius: 60,
            color: colors[index % colors.length],
            titleStyle: TextStyle(
              fontSize: screenWidth(22, context),
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ));
        index++;
        return section;
      },
    ).toList();

    return [sections, categoryData, colors, amount];
  }
}
