import 'package:flutter/foundation.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:money_manager/db/category/db_cat.dart';

import 'expense_list.dart';
import 'income_list.dart';

class ScreenCategory extends StatefulWidget {
  const ScreenCategory({Key? key}) : super(key: key);

  @override
  State<ScreenCategory> createState() => _ScreenCategoryState();
}

class _ScreenCategoryState extends State<ScreenCategory> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    _tabController=TabController(length: 2, vsync: this);
    dbcat().loadagain();
    super.initState();
  } 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(text: "Income",),
            Tab(text: "Expense"),
          ]
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children:[
              IncomeList(),
              ExpenseList(),
            ],
          ),
        )
      ],
    );
  }
}