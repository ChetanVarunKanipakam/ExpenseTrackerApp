

import 'package:flutter/material.dart';
import 'package:expensetrackerapp/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({required this.onAddExpense,super.key});

  final Function onAddExpense;

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController=TextEditingController();
  final _amountController=TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory=Category.liesure;

  void _showDatePicker() async {
    final initialDate=DateTime.now();
    final firstDate=DateTime(initialDate.year-1,initialDate.month,initialDate.day);
    final lastDate=DateTime.now();
    final pickedDate= await showDatePicker(context: context, initialDate: initialDate,firstDate: firstDate, lastDate: lastDate);
    setState(() {
        _selectedDate=pickedDate;
    });
   
  }

  _submitExpense(){
    final parsedamount=double.tryParse(_amountController.text);
    final isvalidAmount= parsedamount ==null;
    if(_titleController.text.trim().isEmpty || isvalidAmount || _selectedDate==null){
      showDialog(context: context, 
      builder: (ctx)=> AlertDialog(
        title: Text("Enter data"),
        content: Text("check whether the Title,Date,Amount and category fieles are entered or not"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(ctx);
          }, child: Text("Okay"))
        ],
      ));
      return;
    }
    widget.onAddExpense(Expense(title: _titleController.text, amount: parsedamount, date: _selectedDate!, category: _selectedCategory));
    Navigator.pop(context);
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
      padding: EdgeInsets.fromLTRB(16,48,16,16),
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
              prefixText: '\u{20B9} ',
              label: Text("Amount")
            ),
          )),
          const SizedBox(width: 16,),
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Text(_selectedDate == null? "Select Date": formatter.format(_selectedDate!)),
            IconButton(onPressed: _showDatePicker,
             icon:const  Icon(Icons.calendar_month))
          ],))
          ],),
          SizedBox(height: 17),
          Row(children: [
            DropdownButton(
              value:_selectedCategory,
              items: Category.values.map(
                (category)=>
                 DropdownMenuItem(
                  value: category,
                  child: Text(category.name))).toList() , 
              onChanged: (value){
                setState(() {
                  if(value==null){
                    return;
                  }
                  _selectedCategory=value;
                });
              }),
              Spacer(),
            TextButton(onPressed: (){
              Navigator.pop(context);
            },
             child: Text("Cancel"),
             ),
            ElevatedButton(onPressed: _submitExpense
            , child: Text("Save Expense"),
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
