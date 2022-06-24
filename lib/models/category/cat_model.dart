import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
part 'cat_model.g.dart';

@HiveType(typeId: 2)
enum type_of_categories{
  @HiveField(0)
  income,

  @HiveField(1)
  expense
}

@HiveType(typeId: 1)
class Catmodel{

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? name;

  @HiveField(2)
  bool? del;

  @HiveField(3)
  type_of_categories? type;

  Catmodel(
    {
      @required this.id,
      @required this.name,
      @required this.type,
      this.del=false,
    }
  );


  @override
  String toString(){
    return "{$name $type}";
  }
}
