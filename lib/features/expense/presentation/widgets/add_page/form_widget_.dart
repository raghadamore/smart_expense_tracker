import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/domain/entities/expense.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/add_delete_update_expense/add_delete_update_expense_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/add_page/card_widget.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
    final amountController = TextEditingController();
  final noteController = TextEditingController();
  String? _enteredNumber;
  String selectedCategory = "Food";
  DateTime selectedDate = DateTime.now();
  final _formKey=GlobalKey<FormState>();
  final List<String> categories = [
    "Food",
    "Transport",
    "Bills",
    "Shopping",
  ];
 
  @override
  Widget build(BuildContext context) {
    return Form(
              key:_formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight(50, context),
                  ),
              
                  CardWidget(
                    child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("amount:", style: TextStyle(fontSize: 18)),
               SizedBox(width: screenWidth(2.6, context)),
              
              // الشرط: إذا _enteredNumber لسا null أظهر الحقل، وإلا أظهر النص
              _enteredNumber == null
                  ? SizedBox(
                      width: screenWidth(3, context),
                      child: TextField(
                        controller: amountController,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: InputBorder.none),
                       // decoration: const InputDecoration(hintText: "اكتب هنا"),
                        onSubmitted: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              _enteredNumber = value; // هنا بنحدث الواجهة
                            });
                          }
                        },
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          _enteredNumber = null; // للعودة للتعديل عند الضغط على الرقم
                        });
                      },
                      child: Text(
                        _enteredNumber!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                     ],
                  )),
               
                  const SizedBox(height: 15),
            
                  /// Category
            
                  CardWidget(
                    
                    child: Row(
                      
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Category:", style: TextStyle(fontSize: 18)),
               SizedBox(width: screenWidth(2.9, context)),

                        SizedBox(
                          width: screenWidth(3, context),
                          child: DropdownButtonFormField(
                            value: selectedCategory,
                            items: categories
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value!;
                              });
                            },
                            decoration: const InputDecoration(
                             // labelText: "Category",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            
                  const SizedBox(height: 15),
            
                  /// Date
            
                  CardWidget(
                    child: ListTile(
                      
                      title: Text("Date",style: TextStyle(fontSize: 18),),
                      trailing: Padding(
                        padding:  EdgeInsets.only(right: screenWidth(10, context)),
                        child: Text(
                          "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                        ),
                      ),
                      onTap: () async {
                        final picked = await showDatePicker(
                          
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                        );
            
                        if (picked != null) {
                          setState(() {
                            selectedDate = picked;
                          });
                        }
                      },
                    ),
                  ),
            
                  const SizedBox(height: 15),
            
                  /// Note
            
                  CardWidget(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                          Padding(
                            padding:  EdgeInsets.only(right: screenWidth(1.3, context),top: screenHeight(39, context)),
                            child: const Text("Note:", style: TextStyle(fontSize: 18)),
                          ),
                        Padding(
                          padding:  EdgeInsets.only(left: screenWidth(49, context)),
                          child: TextFormField(
                            controller: noteController,
                             validator: (value) => value!.isEmpty?"note can`t be empty":null,
                            maxLines: 3,
                            decoration: const InputDecoration(
                             
                              hintText: "Enter a note...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(3.9, context),
                  ),
            
                  SizedBox(
                    width: screenWidth(1.2, context),
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          
                         backgroundColor: const Color.fromARGB(255, 32, 154, 253),
                        ),
                        onPressed: () {
                        final  isvalid=_formKey.currentState!.validate();
                          if (isvalid) {
                              Expense expense = Expense(
                              amount: double.parse(amountController.text),
                              category: selectedCategory,
                              date: selectedDate.toString(),
                              note: noteController.text);
                          context
                              .read<AddDeleteUpdateExpenseBloc>()
                              .add(AddExpenseEvent(expense: expense));
                          }
                        
                        },
                        child:  Text(
                          "Add Expense",
                          style: TextStyle(fontSize: screenWidth(25, context),color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
  }
}