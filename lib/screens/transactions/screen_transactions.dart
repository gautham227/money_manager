import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ScreenTransactions extends StatelessWidget {
  const ScreenTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // scaffold may be removed
    return ListView.separated(
    itemBuilder: (ctx, index){
      return Card(
        shadowColor: Colors.grey[500],
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text("${index+1}"),
          ),
          title: Text("1000"),
          subtitle: Text("Purpose")
        ),
      );
    }, 
    separatorBuilder: (ctx, index){
      return const SizedBox(height: 10);
    },
     itemCount: 10,
    );
  }
}