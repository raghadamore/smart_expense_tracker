part of 'expenses_bloc.dart';

sealed class ExpensesState extends Equatable {
  const ExpensesState();
  
  @override
  List<Object> get props => [];
}

final class ExpensesInitial extends ExpensesState {}
class LoadingExpensesState extends ExpensesState {}
class LoadedExpensesState extends ExpensesState {
  final List<Expense> expenses;

  LoadedExpensesState({required this.expenses});
  @override
  List<Object> get props => [expenses];
}
class ErrorExpensesState extends ExpensesState {
  final String  message;

  ErrorExpensesState({required this.message});
  @override
  List<Object> get props => [message];
}

