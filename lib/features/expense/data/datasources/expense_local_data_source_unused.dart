/*  import 'package:dartz/dartz.dart';
import 'package:smart_expence_tracker1/core/error/exception.dart';
import 'package:smart_expence_tracker1/features/expense/data/models/expense_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
abstract class ExpenseLocalDataSource {
 Future<List<ExpenseModel>> getCachedExpense(); 
 Future<Unit>  cacheExpenses(List<ExpenseModel> expenseModel);
}
const CACHED_EXPENSE="CACHED_EXPENSE"
class ExpenseLocalDataSourceImpl extends ExpenseLocalDataSource {
  final SharedPreferences sharedPreferances;
 
  ExpenseLocalDataSourceImpl({required this.sharedPreferances});
  @override
  Future<Unit> cacheExpenses(List<ExpenseModel> expenseModel) {
    List expenseModelTojson=expenseModel.map<Map<String,dynamic>>((expenseModel) =>expenseModel.toJson() ).toList();
    sharedPreferances.setString("CACHED_EXPENSE",json.encode(expenseModelTojson));
    return  Future.value(unit);
  }

  @override
  Future<List<ExpenseModel>> getCachedExpense() {
    final jsonString=sharedPreferances.getString("CACHED_EXPENSE");
    if (jsonString!=null) {
        List decodeJsonData=json.decode(jsonString);
        List<ExpenseModel> jsonToExpenseModel=decodeJsonData.map<ExpenseModel>((jsonExpenseModel) =>ExpenseModel.fromJson() ).toList();
        return Future.value(jsonToExpenseModel); 
    }
    else {
      throw EmptyCacheExpception();
    }
  }
  
} */