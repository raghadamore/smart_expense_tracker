part of 'add_delete_update_expense_bloc.dart';

sealed class AddDeleteUpdateExpenseState extends Equatable {
  const AddDeleteUpdateExpenseState();
  
  @override
  List<Object> get props => [];
}

final class AddDeleteUpdateExpenseInitial extends AddDeleteUpdateExpenseState {}
 class LoadingAddDeleteUpdateExpenseState extends AddDeleteUpdateExpenseState {}
 class ErrorAddDeleteUpdateExpenseState extends AddDeleteUpdateExpenseState {
  final String message;

  ErrorAddDeleteUpdateExpenseState({
    required this.message
  });
  @override
  List<Object> get props => [message];
 }
 class MessageAddDeleteUpdateExpenseState extends AddDeleteUpdateExpenseState {
  final String message;

  MessageAddDeleteUpdateExpenseState({
    required this.message
  });
  @override
  List<Object> get props => [message];
 }
