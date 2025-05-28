import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController=TextEditingController();
  final _amountController=TextEditingController();


  void _showDatePicker(){
    final initialDate=DateTime.now();
    final firstDate=DateTime(initialDate.year-1,initialDate.month,initialDate.day);
    final lastDate=DateTime.now();
    showDatePicker(context: context, initialDate: initialDate,firstDate: firstDate, lastDate: lastDate);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Title")
            ),
          ),
          Row(children: [
            Expanded(child: TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: "\$ ",
              label: Text("Amount")
            ),
          )),
          const SizedBox(width: 16,),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Text("Select Date"),
            IconButton(onPressed: _showDatePicker,
             icon:const  Icon(Icons.calendar_month))
          ],))
          ],),
          
          Row(children: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            },
             child: Text("Cancel"),
             ),
            ElevatedButton(onPressed: (){
              print(_titleController.text);
            }, child: Text("Save Expense"),
            ),
          ],)
          // Expanded(child: Row(children: [
          //   TextField(
          //     decoration: InputDecoration(
          //       label: Text("amount")
          //     ),
          //   )
          // ],)
          // ),
          // Expanded(child: Row(children: [
          //     Text("row3")
          // ],)),
      ],
      )
    );
  }
}
