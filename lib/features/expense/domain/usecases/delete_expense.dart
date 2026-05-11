import 'package:dartz/dartz.dart';
import 'package:smart_expence_tracker1/core/error/failure.dart';
import 'package:smart_expence_tracker1/features/expense/domain/repositiories/expense_repositiory.dart';

class DeleteExpenseUsecase {
  final ExpenseRepository repository;

  DeleteExpenseUsecase(this.repository);

  Future<Either<Failuer,Unit>> call(int postId)async{
  return await repository.deleteExpense(postId);
  }
}