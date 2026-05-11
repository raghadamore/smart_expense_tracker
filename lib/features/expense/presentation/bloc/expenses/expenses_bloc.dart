import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_expence_tracker1/core/error/failure.dart';
import 'package:smart_expence_tracker1/core/strings/failure.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/domain/usecases/get_all_expenses.dart';

part 'expenses_event.dart';
part 'expenses_state.dart';

class ExpensesBloc extends Bloc<ExpensesEvent, ExpensesState> {
  final GetAllExpenseUsecase getAllExpenses;
  ExpensesBloc({required this.getAllExpenses}) : super(ExpensesInitial()) {
    on<ExpensesEvent>((event, emit) async {
      if (event is GetAllExpensesEvent) {
        emit(LoadingExpensesState());
        final failureOrExpenses = await getAllExpenses();
           emit(mapFailureOrExpensesToState(failureOrExpenses));

           
      } else if (event is RefreshExpenseEvent) {
          emit(LoadingExpensesState());
        final failureOrExpenses = await getAllExpenses();
    emit(mapFailureOrExpensesToState(failureOrExpenses));
      }
    });
  }
  String _mapFaiulerToMessage(Failuer failuer){
   switch (failuer.runtimeType) {
     case ServerFailure:
         return SERVER_FAILURE_MESSAGE;
       
     case EmptyCacheFailure:
         return EMPTY_CACHE_FAILURE_MESSAGE;
       
     case OfflineFailure:
         return OFFLINE_FAILURE_MESSAGE;
       
     default:
       return "Unexpected Error , please try again later .";
   }
  }ExpensesState mapFailureOrExpensesToState(Either<Failuer, List<Expense>> either){
    return  either.fold(
          (Failuer) => ErrorExpensesState(message: _mapFaiulerToMessage(Failuer))
            
          ,
           (expenses) =>
            LoadedExpensesState(expenses: expenses)
          
           );
  }

}
