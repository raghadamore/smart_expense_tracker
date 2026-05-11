import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/expenses/expenses_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/add_page/loading_widget.dart';

class BalanceCartWidget extends StatelessWidget {
  const BalanceCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:  EdgeInsets.all(screenWidth(23, context)),
      padding:  EdgeInsets.all(screenWidth(20, context)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2E66B6), Color(0xFF3D99F5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Total Balance",
              style: TextStyle(color: Colors.white70, fontSize: screenWidth(22, context))),
          SizedBox(height: screenWidth(150, context)),
          BlocBuilder<ExpensesBloc, ExpensesState>(
            builder: (context, state) {
              if (state is LoadingExpensesState) {
                return const LoadingWidget();
              }
              if (state is LoadedExpensesState) {
                
                
           List<Expense> expenses= state.expenses;
          double amount= expenses.fold(0.0, (previousValue, element) => previousValue+element.amount);
                 return Text(
                amount.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth(15, context),
                    fontWeight: FontWeight.bold),
              );
              }
              if (state is ErrorExpensesState) {
                return Text(state.message);
              }return SizedBox();
             
            },
          ),
          SizedBox(height: screenWidth(140, context)),
      const    Text("Monthly Budget \$1,500.00",
              style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }
}
