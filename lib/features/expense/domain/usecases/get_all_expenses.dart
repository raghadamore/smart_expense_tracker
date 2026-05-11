import 'package:dartz/dartz.dart';
import 'package:smart_expence_tracker1/core/error/failure.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/domain/repositiories/expense_repositiory.dart';

class GetAllExpenseUsecase {
  final ExpenseRepository repository;

  GetAllExpenseUsecase(this.repository);
  
  Future<Either<Failuer,List< Expense>>> call()async{
    return await repository.getAllExpense();
  }
}