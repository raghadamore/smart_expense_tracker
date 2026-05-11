import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_expence_tracker1/core/util/messsage_snakbar.dart';
import 'package:smart_expence_tracker1/core/util/utils.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/bloc/add_delete_update_expense/add_delete_update_expense_bloc.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/add_page/form_widget_.dart';
import 'package:smart_expence_tracker1/features/expense/presentation/widgets/add_page/loading_widget.dart';

class AddExpenseUI extends StatefulWidget {
  const AddExpenseUI({super.key});

  @override
  State<AddExpenseUI> createState() => _AddExpenseUIState();
}

class _AddExpenseUIState extends State<AddExpenseUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyle(
              fontSize: screenWidth(40, context),
            ),
          ),
        ),
        title: Text(
          "Add Expense",
          style: TextStyle(
            fontSize: screenWidth(26, context),
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Save"),
          )
        ],
      ),
      body:
          BlocConsumer<AddDeleteUpdateExpenseBloc, AddDeleteUpdateExpenseState>(
              listener: (context, state) {
        if (state is MessageAddDeleteUpdateExpenseState) {
          SnackBarMessage()
              .showSuccsessSnackBar(message: state.message, context: context);
        }
        if (state is ErrorAddDeleteUpdateExpenseState) {
          SnackBarMessage()
              .ShowErrorSnackBar(message: state.message, context: context);
        }
      }, builder: (context, state) {
        if (state is LoadingAddDeleteUpdateExpenseState) {
          return const LoadingWidget();
        }
        return const SingleChildScrollView(child: FormWidget());
      }),
    );
  }
}
