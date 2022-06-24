import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/models/category/cat_model.dart';
import 'package:money_manager/screens/category/income_list.dart';

abstract class DbCat_fns {
  
  Future<List<Catmodel>> getcategories();
  Future<void> insertcat(Catmodel val);
  Future<void>deletecat(String id);
}

const name_catdb="categories";

class dbcat implements DbCat_fns {

  dbcat._internal();
  static dbcat instance=dbcat._internal();
  factory dbcat(){
    return instance;
  }

  ValueNotifier<List<Catmodel>> incomeValueslist=ValueNotifier([]);
  ValueNotifier<List<Catmodel>> expenseValueslist=ValueNotifier([]);


  @override
  Future<void> insertcat(Catmodel val) async {
    final _cdb=await Hive.openBox<Catmodel>(name_catdb);
    await _cdb.put(val.id!, val);
    loadagain();
  }

  @override
  Future<List<Catmodel> > getcategories() async {
    final _cdb=await Hive.openBox<Catmodel>(name_catdb);
    return _cdb.values.toList();
  }

  Future <void> loadagain() async{
    incomeValueslist.value.clear();
    expenseValueslist.value.clear();
    final fulllist= await dbcat().getcategories();
    await Future.forEach( fulllist,(Catmodel element) {
      if(element.type==type_of_categories.income){
        incomeValueslist.value.add(element);
      }else{
        expenseValueslist.value.add(element);
      }
    });
  
    incomeValueslist.notifyListeners();
    expenseValueslist.notifyListeners();
  }

  @override
  Future<void> deletecat(String id) async {
    final _cdb=await Hive.openBox<Catmodel>(name_catdb);
    _cdb.delete(id);
    loadagain();
  }
}