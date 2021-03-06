import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_manager/db/category/db_cat.dart';
import 'package:money_manager/db/transactions/db_trans.dart';
import 'package:money_manager/models/category/cat_model.dart';
import 'package:money_manager/models/transactions/trans_model.dart';

class Addnewtransaction extends StatefulWidget {
  static const routeName = 'addnewtransaction';
  const Addnewtransaction({Key? key}) : super(key: key);

  @override
  State<Addnewtransaction> createState() => _AddnewtransactionState();
}

class _AddnewtransactionState extends State<Addnewtransaction> {

  // variables reqd
  final namecontroller = TextEditingController();
  final amountcontroller = TextEditingController();

  DateTime? datereqd;
  type_of_categories? selected;
  Catmodel? selectedcat;
  String? dropdowndisplay;

  @override
  void initState() {
    // TODO: implement initState
    selected=type_of_categories.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: namecontroller,
                keyboardAppearance: Brightness.dark,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Transaction Name",
                ),
              ),
              TextFormField(
                controller: amountcontroller,
                keyboardAppearance: Brightness.light,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Amount",
                ),
              ),

              SizedBox(height: 12),

              Container(
                width: double.infinity,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      hint: Text("Select Category"),
                      value: dropdowndisplay,
                      items: (selected==type_of_categories.income 
                      ?dbcat().incomeValueslist
                      :dbcat().expenseValueslist
                      ).value.map((e){
                        return DropdownMenuItem(
                          child: Text(e.name!),
                          value: e.id,
                          onTap: (){
                            selectedcat=e;
                          },
                        );
                      }).toList(),
                      onChanged: (newval){
                        print(newval);
                        if(newval==null){
                          return;
                        }
                        setState(() {
                          dropdowndisplay=newval;
                        });
                      },
                      onTap: (){},
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(value: type_of_categories.income,
                        groupValue: selected,
                        onChanged: <type_of_categories>(newval){
                          setState(() {
                            selected=newval;
                            dropdowndisplay=null;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Color.fromARGB(255, 162, 129,252);
                            }
                            return Color.fromARGB(255, 162, 129, 252);
                         },
                        ),
                      ),
                      Text("Income"),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: type_of_categories.expense,
                        groupValue: selected,
                        onChanged: <type_of_categories>(newval){
                          setState(() {
                            selected=newval;
                            dropdowndisplay=null;
                          });
                        },
                        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                            if (states.contains(MaterialState.disabled)) {
                              return Color.fromARGB(255, 162, 129,252);
                            }
                            return Color.fromARGB(255, 162, 129, 252);
                         },
                        ),
                      ),
                      Text("Expense"),
                    ],
                  ),
                ],
              ),

              // SizedBox(height: 2),

              TextButton.icon(onPressed: () async{
                final date= await showDatePicker(context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 365*100)),
                lastDate: DateTime.now()
                );

                if(date!=null){
                  print(date);
                  setState(() {
                    datereqd=date;
                  });

                }
                else return;
              },
                icon: Icon(Icons.calendar_today),
                label: Text(
                  datereqd==null?"Select Date": (datereqd!).day.toString()+"-"+(datereqd!).month.toString()+"-"+(datereqd!).year.toString(),
                )
              ),

            SizedBox(height: 4),

              ElevatedButton.icon (
                onPressed: (){
                  newtransaction();
                },
                icon: Icon(
                  Icons.check, 
                  color: Colors.amber,
                ),
                label: Text("Submit", 
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
            ],
          ),
        ),
      ),

    );
  }

  Future<void> newtransaction() async{
    final transacname_val=namecontroller.text;
    final ret_amt_val=amountcontroller.text;
    if(transacname_val==null || ret_amt_val==null || dropdowndisplay==null || datereqd==null || selectedcat==null){
      return;
    }

    double? amt_val=double.tryParse(ret_amt_val);
    if(amt_val==null){
      return;
    }

    Transmod transmodel=Transmod(
      purpose: transacname_val,
      amount: amt_val,
      category: selectedcat!,
      date: datereqd!,
      type: selected!,
    );

    await dbtransac.instance.addnewtransaction(transmodel);
    Navigator.of(context).pop();
    dbtransac().loadagainTransac();
  }

}