import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:money_manager/db/category/db_cat.dart';
import 'package:money_manager/models/category/cat_model.dart';

class IncomeList extends StatelessWidget {
  const IncomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dbcat().incomeValueslist,
     builder: (BuildContext ctx, List<Catmodel> listvals, Widget? _){
      return ListView.separated(
        itemBuilder: ((context, index) {
          final cat=listvals[index];
          return Card(
            child: ListTile(
              title: Text(cat.name!),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  dbcat().deletecat(cat.id!);
                },
              ),
            )
          );
        }
      ),
      separatorBuilder: (ctx, index){
        return const SizedBox(height: 8);
      },
      itemCount: listvals.length,
      );
     }
    );
  }
}