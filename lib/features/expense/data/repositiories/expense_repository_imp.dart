import 'package:dartz/dartz.dart';
import 'package:smart_expence_tracker1/core/error/failure.dart';
import 'package:smart_expence_tracker1/features/expense/data/datasources/expense_local_data_source.dart';
import 'package:smart_expence_tracker1/features/expense/data/models/expense_model.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/domain/repositiories/expense_repositiory.dart';
import 'package:sqflite/sqflite.dart';

class ExpenseRepositoryImp implements ExpenseRepository {
  final ExpenseLocaleDatatSource localDatatSource;

  ExpenseRepositoryImp( {required this.localDatatSource});
  @override
  Future<Either<Failuer, Unit>> addExpense(Expense expense) async{
    try {
       final model=ExpenseModel(amount: expense.amount, category: expense.category, date: expense.date, note: expense.note);
   await localDatatSource.addExpense(model);
    return right(unit);
    } on DatabaseException {
      return left(DatabaseFailure());
    }
  
  }

  @override
  Future<Either<Failuer, Unit>> deleteExpense(int id)async {
    try {
   await localDatatSource.deleteExpense(id);
    return right(unit);
    } on DatabaseException {
      return left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failuer, List<Expense>>> getAllExpense()async {
    try {
    final response=await localDatatSource.getAllExpense();
    return right(response);
    } on DatabaseException {
      return left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failuer, Unit>> updateExpense(Expense expense)async {
    try {
       final model=ExpenseModel(amount: expense.amount, category: expense.category, date: expense.date, note: expense.note);
   await localDatatSource.updateExpense(model);
    return right(unit);
    } on DatabaseException {
      return left(DatabaseFailure());
    }
  }
  
}