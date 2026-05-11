import 'package:dartz/dartz.dart';
import 'package:smart_expence_tracker1/core/error/failure.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';

abstract class ExpenseRepository {
  
 Future<Either<Failuer,List< Expense>>> getAllExpense();
 Future<Either<Failuer,Unit>> deleteExpense(int id);
 Future<Either<Failuer,Unit>> updateExpense(Expense expense);
 Future<Either<Failuer,Unit>> addExpense(Expense expense);
}