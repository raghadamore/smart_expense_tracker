import 'package:dartz/dartz.dart';
import 'package:smart_expence_tracker1/core/error/failure.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/domain/repositiories/expense_repositiory.dart';

class AddExpenseUsecase {
  final ExpenseRepository repository;

  AddExpenseUsecase(this.repository);
  Future<Either<Failuer,Unit>> call(Expense expense)async{
    return await repository.addExpense(expense);
  }
}