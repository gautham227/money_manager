import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/models/category/cat_model.dart';
part 'trans_model.g.dart';

@HiveType(typeId: 3)
class Transmod{

  @HiveField(0)
  final String purpose;
  @HiveField(1)
  final type_of_categories type;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final DateTime date;
  @HiveField(4)
  final Catmodel category;
  @HiveField(5)
  String? id;
  
  Transmod({
    required this.purpose,
    required this.amount,
    required this.type,
    required this.date,
    required this.category,
  }){
    id=DateTime.now().millisecondsSinceEpoch.toString();
  }
}