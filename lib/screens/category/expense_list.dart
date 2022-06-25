import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:money_manager/db/category/db_cat.dart';
import 'package:money_manager/models/category/cat_model.dart';


class ExpenseList extends StatelessWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dbcat().expenseValueslist,
     builder: (BuildContext ctx, List<Catmodel> listvals, Widget? _){
      return ListView.separated(
        itemBuilder: ((context, index) {
          final cat=listvals[index];
          return Card(
            child: ListTile(
              title: Text(cat.name!),
              trailing: IconButton(
                icon: Icon(Icons.delete,
                  color: Color.fromARGB(255, 223, 53, 41),
              ),
                onPressed: (){
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