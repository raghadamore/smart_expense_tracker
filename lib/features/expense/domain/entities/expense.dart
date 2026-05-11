import 'package:equatable/equatable.dart';

class Expense extends Equatable {
  final int? id;
  final double amount;
  final String category;
  final String date;
  final String note;

 const Expense({this.id,required this.amount,required this.category,required this.date,required this.note});
  @override
  List<Object?> get props =>[id,amount,category,date,note];
  
}