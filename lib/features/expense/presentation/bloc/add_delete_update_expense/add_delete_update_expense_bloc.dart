import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_expence_tracker1/core/error/failure.dart';
import 'package:smart_expence_tracker1/core/strings/failure.dart';
import 'package:smart_expence_tracker1/core/strings/messages.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/domain/usecases/add_expense.dart';
import 'package:smart_expence_tracker1/features/expense/domain/usecases/delete_expense.dart';
import 'package:smart_expence_tracker1/features/expense/domain/usecases/update_exprnse.dart';
import 'package:dartz/dartz.dart';
part 'add_delete_update_expense_event.dart';
part 'add_delete_update_expense_state.dart';

class AddDeleteUpdateExpenseBloc
    extends Bloc<AddDeleteUpdateExpenseEvent, AddDeleteUpdateExpenseState> {
  final AddExpenseUsecase addExpense;
  final DeleteExpenseUsecase deleteExpense;
  final UpdateExpenseUsecase updateExpense;
  AddDeleteUpdateExpenseBloc({
    required this.addExpense,
    required this.deleteExpense,
    required this.updateExpense,
  }) : super(AddDeleteUpdateExpenseInitial()) {
    on<AddDeleteUpdateExpenseEvent>((event, emit) async {
      if (event is AddExpenseEvent) {
        emit(LoadingAddDeleteUpdateExpenseState());
        final failureOrDoneMessage = await addExpense(event.expense);
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, ADD_SUCCSSES_MESSAGE));
      } else if (event is UpdateExpenseEvent) {
        emit(LoadingAddDeleteUpdateExpenseState());
        final failureOrDoneMessage = await updateExpense(event.expense);
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, UPDATE_SUCCSSES_MESSAGE));
      } else if (event is DeleteExpenseEvent) {
        emit(LoadingAddDeleteUpdateExpenseState());
        final failureOrDoneMessage = await deleteExpense(event.expenseId);
        emit(_eitherDoneMessageOrErrorState(
            failureOrDoneMessage, DELETE_SUCCSSES_MESSAGE));
      }
    });
  }
  String _mapFaiulerToMessage(Failuer failuer) {
    switch (failuer.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;

      default:
        return "Unexpected Error , please try again later .";
    }
  }

  AddDeleteUpdateExpenseState _eitherDoneMessageOrErrorState(
      Either<Failuer, Unit> either, String meesage) {
    return either.fold(
        (failure) => ErrorAddDeleteUpdateExpenseState(
            message: _mapFaiulerToMessage(failure)),
        (_) => MessageAddDeleteUpdateExpenseState(message: meesage));
  }
}
