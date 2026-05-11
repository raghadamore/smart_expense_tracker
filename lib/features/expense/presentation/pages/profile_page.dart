import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/expenses/expenses_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/add_page/loading_widget.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/profile_page/card_category_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6F9), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:  Text(
          "Categories",
          style: TextStyle(
              color:const Color(0xFF1D2633),
              fontWeight: FontWeight.bold,
              fontSize: screenWidth(18, context)),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child:  Text("Edit",
                style: TextStyle(color:const Color(0xFF1D2633), fontSize: screenWidth(22,context))),
          ),
           SizedBox(width:screenWidth(50, context) ),
        ],
      ),
      body: BlocBuilder<ExpensesBloc, ExpensesState>(
        
        builder: (context, state) {
          if (state is LoadingExpensesState) {
            return const LoadingWidget();
          }if (state is ErrorExpensesState) {
            return Center(child: Text(state.message),);
          }if (state is LoadedExpensesState) {
              return ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: state.expenses.length,
            itemBuilder: (context, index) {
              final item = state.expenses[index];
              return CardCategoryWidget( data: item);
            },
          );
          }return const SizedBox();
        
        },
      ),
    );
  }

  
 
}
