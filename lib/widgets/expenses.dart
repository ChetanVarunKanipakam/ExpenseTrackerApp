import 'package:expensetrackerapp/widgets/expenses_list/expenses_list.dart';
import 'package:expensetrackerapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expensetrackerapp/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(title: "flutter course", amount: 19.99, date: DateTime.now(), category: Category.liesure),
    Expense(title: "mt fuji", amount: 100.99, date: DateTime.now(), category: Category.travel),
  ];

  void _displayModal(){
      showModalBottomSheet(context: context, builder: (ctx) {
        return NewExpense();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker App"),
        actions: [
          IconButton(onPressed: _displayModal
          , icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text("chart"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses))
        ],
      ),
    );
  }
}
