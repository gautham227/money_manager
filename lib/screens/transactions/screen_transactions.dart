import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/db/category/db_cat.dart';
import 'package:money_manager/db/transactions/db_trans.dart';
import 'package:money_manager/models/category/cat_model.dart';
import 'package:money_manager/models/transactions/trans_model.dart';

class ScreenTransactions extends StatelessWidget {
  ScreenTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dbtransac().loadagainTransac();
    dbcat().loadagain();
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
                radius: 30,
                backgroundColor: val.type==type_of_categories.income?Colors.green:Colors.red,
                child: Text(getdate(val.date), 
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

  String getdate(DateTime date){
    List<String> months=["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    return "${date.day}th\n${months[date.month-1]}";
  }

}