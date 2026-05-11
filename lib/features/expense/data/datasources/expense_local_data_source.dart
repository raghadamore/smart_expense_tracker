import 'package:dartz/dartz.dart';
import 'package:smart_expence_tracker1/features/expense/data/datasources/local_database.dart';
import 'package:smart_expence_tracker1/features/expense/data/models/expense_model.dart';

abstract class ExpenseLocaleDatatSource {
 Future<List<ExpenseModel>> getAllExpense();
 Future<Unit> deleteExpense(int expenseId);
 Future<Unit> updateExpense(ExpenseModel expense);
 Future<Unit> addExpense(ExpenseModel expense);
}

class ExpenseLocaleDatatSourceImp implements ExpenseLocaleDatatSource {
  final LocalDatabase database=LocalDatabase();
 @override
Future<Unit> addExpense(ExpenseModel expense) async {
  final dbClient = await database.db;

  await dbClient!.insert(
    'expenses',
    expense.toMap(),
  );

  return unit;
}
@override
Future<Unit> deleteExpense(int expenseId) async {
  final dbClient = await database.db;

  await dbClient!.delete(
    'expenses',
    where: 'id = ?',
    whereArgs: [expenseId],
  );

  return unit;
}
 @override
Future<List<ExpenseModel>> getAllExpense() async {
  final dbClient = await database.db;

  final result = await dbClient!.query('expenses');

  return result.map((e) => ExpenseModel.fromMap(e)).toList();
}
@override
Future<Unit> updateExpense(ExpenseModel expense) async {
  final dbClient = await database.db;

  await dbClient!.update(
    'expenses',
    expense.toMap(),
    where: 'id = ?',
    whereArgs: [expense.id!],
  );

  return unit;
}
  
}