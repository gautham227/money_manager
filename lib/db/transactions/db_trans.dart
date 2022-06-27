import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/models/transactions/trans_model.dart';

const name_db="dbtransac";

abstract class Transacmodfns {
  Future <void> addnewtransaction (Transmod ele);
  Future <List<Transmod>> getdata();
  Future<void> transacdel(String id);
}

class dbtransac implements Transacmodfns{

  dbtransac._internal();
  static dbtransac instance=dbtransac._internal();
  factory dbtransac(){
    return instance;
  }

  ValueNotifier<List<Transmod>> notifier=ValueNotifier([]);

  @override
  Future<void> addnewtransaction(Transmod ele) async{
    // TODO: implement addnewtransaction
    final tdb=await Hive.openBox<Transmod>(name_db);
    await tdb.put(ele.id,ele);
    
    // throw UnimplementedError();
  }

  Future<void> loadagainTransac() async{
    final dbtransac= await getdata();
    dbtransac.sort((a,b)=>b.date.compareTo(a.date));
    notifier.value.clear();
    notifier.value.addAll(dbtransac);
    notifier.notifyListeners();
  }  

  @override
  Future<List<Transmod>> getdata() async{
    final dbtransac=await Hive.openBox<Transmod>(name_db);
    return dbtransac.values.toList();
  }
  
  @override
  Future<void> transacdel(String id) async{
    // TODO: implement transacsel'
    print("del");
    final dbtransac=await Hive.openBox<Transmod>(name_db);
    await dbtransac.delete(id);
    loadagainTransac();
    // throw UnimplementedError();
  }
}