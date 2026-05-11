/* import 'package:dartz/dartz.dart';
import 'package:smart_expence_tracker1/core/error/exception.dart';
import 'package:smart_expence_tracker1/core/error/failure.dart';
import 'package:smart_expence_tracker1/core/network/network_info.dart';
import 'package:smart_expence_tracker1/features/expense/data/datasources/expense_local_data_source.dart';
import 'package:smart_expence_tracker1/features/expense/data/datasources/expense_remote_data_source.dart';
import 'package:smart_expence_tracker1/features/expense/data/models/expense_model.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/domain/repositiories/expense_repositiory.dart';

typedef Future<Unit>  DeleteOrUpdateOrAddExpense();
class ExpenseRepositoryImp implements ExpenseRepository {
  final ExpenseLocaleDatatSource localeDataSource;
  final ExpenseRemoteDatatSource remoteDataSource;
  final NetworkInfo networkInfo;
  const ExpenseRepositoryImp({
    required this.localeDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failuer, List<Expense>>> getAllExpense() async {
    if (await networkInfo.isconnected) {
      try {
        final remoteExpense = await remoteDataSource.getAllExpense();
        //localeDataSource.cachedExpense(remoteExpense);
        return right(remoteExpense);
      } on ServerExpception {
        return left(ServerFailure());
      }
    } else {
      try {
        final localexpense = await localeDataSource.getAllExpense();
        return right(localexpense);
      } on EmptyCacheExpception {
        return left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failuer, Unit>> addExpense(Expense expense) async{
    final expenseModel = ExpenseModel(
        amount: expense.amount,
        category: expense.category,
        date: expense.date,
        note: expense.note);
   return await _getMessage(() =>  remoteDataSource.addExpense(expenseModel));   
  }

  @override
  Future<Either<Failuer, Unit>> deleteExpense(int expenseId)async {
     return await _getMessage(() =>  remoteDataSource.deleteExpense(expenseId));

  }

  @override
  Future<Either<Failuer, Unit>> updateExpense(Expense expense)async {
   final expenseModel = ExpenseModel(
        amount: expense.amount,
        category: expense.category,
        date: expense.date,
        note: expense.note);
  return await _getMessage(() =>  remoteDataSource.updateExpense(expenseModel));
  }
   Future<Either<Failuer, Unit>> _getMessage( DeleteOrUpdateOrAddExpense deleteOrUpdateOrAddExpense)async{
     if (await networkInfo.isconnected) {
      try {
         await deleteOrUpdateOrAddExpense;
        return right(unit);
      } on ServerExpception {
        return left(ServerFailure());
      }
       
    }else{
      return left(OfflineFailure());
    }  
  }
}
 */