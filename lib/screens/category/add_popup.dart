import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_manager/db/category/db_cat.dart';
import 'package:money_manager/models/category/cat_model.dart';

ValueNotifier<type_of_categories> selectedcat=ValueNotifier(type_of_categories.income);

Future<void> addpopup(BuildContext context) async{
  // pop up radio bar to select category and add new element to the corresponding category

  final namecontroller=TextEditingController();

  showDialog(context: context, builder: (ctx){
      return SimpleDialog(
        title: Text("Add Category"),
        children: [
          Padding(
            padding: const EdgeInsets.all(6.3),
            child: TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Category Name"
              ),
            )
          ),

          Padding(
            padding: const EdgeInsets.all(6.3),
            child: Row(
              children: [
                Rbutton(title: "Income", type: type_of_categories.income),
                Rbutton(title: "Expense", type: type_of_categories.expense),
              ],
            )
          ),

          Padding(
            padding: const EdgeInsets.all(6.3),
            child: ElevatedButton(onPressed: (){
              final content=namecontroller.text;
              if(content.isEmpty){
                return;
              }
              final _element=Catmodel(id: DateTime.now().millisecondsSinceEpoch.toString(), name: content, type: selectedcat.value);
              dbcat.instance.insertcat(_element);
              Navigator.of(ctx).pop();
            }, child: Text("Add")),
          )

        ],
      );
    }
  );
}

class Rbutton extends StatelessWidget{
  final String title;
  final type_of_categories type;
  const Rbutton({
    Key? key,
    required this.title,
    required this.type,
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedcat,
          builder: (BuildContext ctx, type_of_categories newtype, Widget? _){
            return Radio<type_of_categories>(
              value: type,
              groupValue: selectedcat.value,
              onChanged: (value){
                if(value==null){
                  return;
                }
                selectedcat.value=value;
                selectedcat.notifyListeners();
              },
            );
          },
        ),
        Text(title),
      ],
    );
  }
}

