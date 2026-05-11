import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_expence_tracker1/core/network/network_info.dart';
import 'package:smart_expence_tracker1/features/expense/data/datasources/expense_local_data_source.dart';
import 'package:smart_expence_tracker1/features/expense/data/repositiories/expense_repository_imp.dart';
import 'package:smart_expence_tracker1/features/expense/domain/repositiories/expense_repositiory.dart';
import 'package:smart_expence_tracker1/features/expense/domain/usecases/add_expense.dart';
import 'package:smart_expence_tracker1/features/expense/domain/usecases/delete_expense.dart';
import 'package:smart_expence_tracker1/features/expense/domain/usecases/get_all_expenses.dart';
import 'package:smart_expence_tracker1/features/expense/domain/usecases/update_exprnse.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/add_delete_update_expense/add_delete_update_expense_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/expenses/expenses_bloc.dart';
final  sl = GetIt.instance;


Future<void> init() async {
  //! feature -  expense
print(sl);
  //bloc
  sl.registerFactory(() => ExpensesBloc(getAllExpenses: sl()));
  sl.registerFactory(() => AddDeleteUpdateExpenseBloc(
      addExpense: sl<AddExpenseUsecase>(),
      
      updateExpense: sl(),
      deleteExpense: sl())
      );

  //usecases
sl.registerLazySingleton((() => GetAllExpenseUsecase(sl())));
sl.registerLazySingleton(() => AddExpenseUsecase(sl()));
sl.registerLazySingleton(() => DeleteExpenseUsecase(sl()));
sl.registerLazySingleton(() => UpdateExpenseUsecase(sl()));

 
  //datasources
sl.registerLazySingleton<ExpenseLocaleDatatSource>(() =>ExpenseLocaleDatatSourceImp() );
 //repository
sl.registerLazySingleton<ExpenseRepository>(
  () => ExpenseRepositoryImp(localDatatSource: sl<ExpenseLocaleDatatSource>()),
);
  //! core
sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //!external
  final sharedPrefrenses=await SharedPreferences.getInstance();
  sl.registerLazySingleton(() =>sharedPrefrenses );
  sl.registerLazySingleton(() =>http.Client() );
  sl.registerLazySingleton(() =>InternetConnectionChecker() );
  
}
