import 'package:hive_flutter/adapters.dart';
import 'package:money_manager/models/transactions/trans_model.dart';

const name_db="dbtransac";

abstract class Transacmodfns {
  Future <void> addnewtransaction (Transmod ele);

}

class dbtransac implements Transacmodfns{
  
  dbtransac._internal();
  static dbtransac instance=dbtransac._internal();
  factory dbtransac(){
    return instance;
  }

  @override
  Future<void> addnewtransaction(Transmod ele) async{
    // TODO: implement addnewtransaction
    final tdb=await Hive.openBox<Transmod>(name_db);
    await tdb.put(ele.id,ele);
    
    // throw UnimplementedError();
  }

}