import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Addnewtransaction extends StatelessWidget {
  static const routeName = 'addnewtransaction';
  const Addnewtransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Add Transaction"),

    );
  }
}