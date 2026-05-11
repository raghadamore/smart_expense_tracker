import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/expenses/expenses_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/add_page/loading_widget.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/home_page/start_cart_widget.dart';

class ManthlyStateWidget extends StatelessWidget {
  const ManthlyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(20, context)),
      child: BlocBuilder<ExpensesBloc, ExpensesState>(
        builder: (context, state) {
          if (state is LoadingExpensesState) {
            return const LoadingWidget();
          }
          if (state is ErrorExpensesState) {
            return Text(state.message);
          }
          if (state is LoadedExpensesState) {
            DateTime now = DateTime.now();
            List<Expense> expenses = state.expenses;
            double monthTotal = expenses.where(
              (expense) {
                DateTime date = DateTime.parse(expense.date);
                return date.month == now.month && date.year == now.year;
              },
            ).fold(0, (sum, item) => sum + item.amount);
            DateTime startofweek =
                now.subtract(Duration(days: now.weekday - 1));
            double weektotal = expenses.where(
              (element) {
                DateTime date = DateTime.parse(element.date);
                return date
                    .isAfter(startofweek.subtract(const Duration(days: 1)));
              },
            ).fold(0, (sum, item) => sum + item.amount);
            return Row(
              children: [
                StartCartWidget(
                    title: "This Month",
                    amount: monthTotal.toString(),
                    color: const Color(0xFF5367BE)),
                SizedBox(width: screenWidth(60, context)),
                StartCartWidget(
                    title: "This Week",
                    amount: weektotal.toString(),
                    color: const Color(0xFF32A0E3)),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
