import 'package:flutter/material.dart';

import 'package:expensetrackerapp/models/expense.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense,{super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 15
      ),
      child: Column(children: [
        Text(expense.title),
        SizedBox(height: 20,),
        Row(children: [
          Text('\u{20B9} ${expense.amount.toStringAsFixed(2)}'),
          const Spacer(),
          Row(children: [
            Icon(categoryIcons[expense.category]),
            SizedBox(width: 8,),
            Text(expense.formattedDate)
          ],)
        ],)
      ],)
      )
    );
  }
}