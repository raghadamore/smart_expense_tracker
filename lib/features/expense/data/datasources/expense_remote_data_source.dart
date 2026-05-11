/* import 'dart:convert';
import 'dart:core';


import 'package:dartz/dartz.dart';
import 'package:smart_expence_tracker1/core/error/exception.dart';
import 'package:smart_expence_tracker1/features/expense/data/models/expense_model.dart';
import 'package:http/http.dart' as http;
abstract class ExpenseRemoteDatatSource {
 Future<List<ExpenseModel>> getAllExpense();
 Future<Unit> deleteExpense(int expenseId);
 Future<Unit> updateExpense(ExpenseModel expense);
 Future<Unit> addExpense(ExpenseModel expense);
}
const BASE_URL ="https://jsonplaceholder.typicode.com";
class ExpenseRemoteDatatSourceImp implements ExpenseRemoteDatatSource {
  final http.Client client;

  ExpenseRemoteDatatSourceImp({required this.client});
  @override
  Future<List<ExpenseModel>> getAllExpense() async{
    final response=await client.get(Uri.parse(BASE_URL+"/posts/"),headers: {
      "Content-Type":"application/json"
    });
    if (response.statusCode==200) {
      final List decodeJson=json.decode(response.body) as List;
      final List<ExpenseModel>  expenseModels=decodeJson.map<ExpenseModel>((jsonExpenseModel) =>ExpenseModel.fromJson(jsonExpenseModel) ).toList();
      return expenseModels;
    }else{
      throw ServerExpception();
    }
  }

  @override
  Future<Unit> addExpense(ExpenseModel expense)async {
    final body={
      "amount":expense.amount,
      "note":expense.note
    };
    final response=await client.post(Uri.parse(BASE_URL+"/posts/"),body: body);
    if (response.statusCode==201) {
      return Future.value(unit);
    }else{
        throw ServerExpception();
    }
  }

  @override
  Future<Unit> deleteExpense(int expenseId)async {
   final response=await client.delete(Uri.parse(BASE_URL+"/posts/${expenseId.toString()}"),headers: {
      "Content-Type":"application/json"
    } );
if (response.statusCode==200) {
  return Future.value(unit);
}else{
  throw ServerExpception();
}
  }



  @override
  Future<Unit> updateExpense(ExpenseModel expense)async {
    final expenseId=expense.id.toString();
    final body={
        "amount":expense.amount,
        "note":expense.amount
    };
     final response=await client.patch(Uri.parse(BASE_URL+"/posts/${expenseId}"),body: body);
    if (response.statusCode==200) {
  return Future.value(unit);
}else{
  throw ServerExpception();
}
  }
  
} */