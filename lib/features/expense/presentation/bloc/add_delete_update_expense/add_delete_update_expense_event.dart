part of 'add_delete_update_expense_bloc.dart';

sealed class AddDeleteUpdateExpenseEvent extends Equatable {
  const AddDeleteUpdateExpenseEvent();

  @override
  List<Object> get props => [];
}
class AddExpenseEvent extends AddDeleteUpdateExpenseEvent {
  final Expense expense;

  AddExpenseEvent({
    required this.expense
  });
  @override
  List<Object> get props => [expense];
}

class UpdateExpenseEvent extends AddDeleteUpdateExpenseEvent {
  final Expense expense;

  UpdateExpenseEvent({
    required this.expense
  });
  @override
  List<Object> get props => [expense];
}

class DeleteExpenseEvent extends AddDeleteUpdateExpenseEvent {
  final int expenseId;

  DeleteExpenseEvent({
    required this.expenseId
  });
  @override
  List<Object> get props => [expenseId];
}
