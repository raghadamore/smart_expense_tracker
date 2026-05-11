part of 'expenses_bloc.dart';

sealed class ExpensesEvent extends Equatable {
  const ExpensesEvent();

  @override
  List<Object> get props => [];
}
class GetAllExpensesEvent extends ExpensesEvent {}
class RefreshExpenseEvent extends ExpensesEvent {}
