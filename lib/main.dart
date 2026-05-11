import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/add_delete_update_expense/add_delete_update_expense_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/expenses/expenses_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/pages/main_page.dart';
import 'injection_container.dart' as di;
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider( create: (_) => di.sl<ExpensesBloc>(),),
      BlocProvider( create: (_) => di.sl<AddDeleteUpdateExpenseBloc>(),)
    ] , child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home:MainPage()
    )
    );
  }
}