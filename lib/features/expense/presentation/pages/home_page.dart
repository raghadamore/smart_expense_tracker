 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/expenses/expenses_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/home_page/balance_cart_widget.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/home_page/header_widget.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/home_page/manthly_state_widget.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/home_page/recent_transaction_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    
    super.initState();
    context.read<ExpensesBloc>().add(GetAllExpensesEvent());
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor:  Color(0xFFF3F6F9), // خلفية الصفحة الفاتحة
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            BalanceCartWidget(),
            ManthlyStateWidget(),
             RecentTransactions(),
          ],
        ),
      ),
      
    );
  }
}