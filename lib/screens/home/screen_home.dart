import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:money_manager/db/category/db_cat.dart';
import 'package:money_manager/models/category/cat_model.dart';
import 'package:money_manager/screens/category/add_popup.dart';
import 'package:money_manager/screens/category/screen_categories.dart';
import 'package:money_manager/screens/home/widget/navbottom.dart';
import 'package:money_manager/screens/transactions/addnewtransactions.dart';
import 'package:money_manager/screens/transactions/screen_transactions.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key}) : super(key: key);

  final listOfScreens = [
    ScreenTransactions(),
    ScreenCategory(),
  ];

  static ValueNotifier<int> index=ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Money Manager"),
        centerTitle: true,
      ),

      bottomNavigationBar: const HomeBottomNav(),
      body: SafeArea(
        child: 
        ValueListenableBuilder(
          valueListenable: index,
          builder: (BuildContext ctx, int newindex, Widget? _){
            return listOfScreens[newindex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(index.value==0){
            print("add transaction");
            Navigator.pushNamed(context, Addnewtransaction.routeName);
          }
          else{
            print("add category");

            addpopup(context);
            // final ex=Catmodel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: "Travel",
            //   type: type_of_categories.expense,
            // );
            // dbcat().insertcat(ex);
          }
        },
        child: Icon(Icons.add_circle),
      ),
    );
  }
}