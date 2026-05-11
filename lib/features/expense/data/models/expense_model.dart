import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';

class ExpenseModel extends Expense {
  const ExpenseModel(
      {required super.amount,
      required super.category,
      required super.date,
      required super.note});

 factory ExpenseModel.fromMap(Map<String,dynamic> map){
  return ExpenseModel(amount: map["amount"], category: map["category"], date: map["date"], note: map["note"]);
 }     
  Map<String,dynamic> toMap(){
  return {
   "amount":amount,
   "category":category,
   "date":date,
   "note":note
  };
 }

}
