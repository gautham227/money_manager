import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_manager/models/category/cat_model.dart';

class Addnewtransaction extends StatelessWidget {
  static const routeName = 'addnewtransaction';
  const Addnewtransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                keyboardAppearance: Brightness.dark,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Transaction Name",
                ),
              ),
              TextFormField(
                keyboardAppearance: Brightness.light,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Amount",
                ),
              ),
              TextButton.icon(onPressed: (){},
                icon: Icon(Icons.calendar_today),
                label: Text("Select Date")
              ),
              // Radio(value: Text("Income"), groupValue: type_of_categories.income, onChanged: (){});
            ],
          ),
        ),
      ),

    );
  }
}