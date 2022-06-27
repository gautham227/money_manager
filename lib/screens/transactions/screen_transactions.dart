import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/db/transactions/db_trans.dart';
import 'package:money_manager/models/transactions/trans_model.dart';

class ScreenTransactions extends StatelessWidget {
  ScreenTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dbtransac().loadagainTransac();
    return ValueListenableBuilder(
      valueListenable: dbtransac().notifier,
      builder: (BuildContext ctx, List<Transmod> list, Widget? _){
        print(list.length);
        return ListView.separated(
        itemBuilder: (ctx, index){
          final val=list[index];
          return Card(
            shadowColor: Colors.grey[500],
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green,
                child: Text("${index+1}", 
                style: TextStyle(
                  color: Colors.white,
                ),
                ),
              ),
              title: Text("Rs ${val.amount}"),
              subtitle: Text("${val.category.name}"),
            ),
          );
        }, 
        separatorBuilder: (ctx, index){
          return const SizedBox(height: 10);
        },
        itemCount: list.length,
        );
      },
      );
  }

  

}