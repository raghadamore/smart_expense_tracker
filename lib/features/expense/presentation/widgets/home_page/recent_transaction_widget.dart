

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/expenses/expenses_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/add_page/loading_widget.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/home_page/transactiom_item_widget.dart';

class RecentTransactions extends StatefulWidget {
  const RecentTransactions({super.key});

  @override
  State<RecentTransactions> createState() => _RecentTransactionsState();
}

class _RecentTransactionsState extends State<RecentTransactions> {
  @override
  void initState() {
    super.initState();
    
    context.read<ExpensesBloc>().add(GetAllExpensesEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.all(screenWidth(20, context)),
      padding:  EdgeInsets.all(screenWidth(20, context)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text("Recent Transactions", style: TextStyle(fontSize: screenWidth(25, context), fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_forward_ios, size: screenWidth(27, context)),
            ],
          ),
           SizedBox(height: screenWidth(50, context)),
          BlocBuilder<ExpensesBloc, ExpensesState>(
            builder: (context, state) {
              if (state is LoadingExpensesState) {
                return SizedBox(
                  height: screenHeight(3.6, context),
                  child: LoadingWidget());
              }
              if (state is LoadedExpensesState) {
                 return SizedBox(
                  height: screenHeight(3.6, context),
                   child: ListView.builder(
                    itemCount: state.expenses.length,
                    itemBuilder: (context, index) {
                      return  TransactionsItemWidget(icon: Icons.shopping_basket,title: state.expenses[index].category,date:state.expenses[index].date,amount:state.expenses[index].amount.toString(),iconColor:  Colors.orange);
                 
                 
                    },),
                 );
               
              }
              if (state is ErrorExpensesState) {
                return SizedBox(
                  height: screenHeight(3.6, context),
                  child: Center(child: Text(state.message,style:const TextStyle(color: Colors.red),),));
              }
             return const SizedBox();
            },
          ),
  
        ],
      ),
    );
  }
}