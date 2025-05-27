import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter= DateFormat().add_yMd();

const uuid=Uuid();
enum Category {food,liesure,work,travel}

const categoryIcons= {
  Category.food: Icons.dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
  Category.liesure: Icons.movie
};

class Expense {
  Expense({required this.title,required this.amount,required this.date,required this.category}): id= uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;


  String get formattedDate{
    return formatter.format(date);
  }
}