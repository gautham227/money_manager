import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_manager/models/category/cat_model.dart';
import 'package:money_manager/screens/home/screen_home.dart';
import 'package:money_manager/screens/transactions/addnewtransactions.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if(Hive.isAdapterRegistered(typeofcategoriesAdapter().typeId)==false){
    Hive.registerAdapter(typeofcategoriesAdapter());
  }

  if(Hive.isAdapterRegistered(CatmodelAdapter().typeId)==false){
    Hive.registerAdapter(CatmodelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set theme to dark mode,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ScreenHome(),
      routes: {
        Addnewtransaction.routeName: (ctx) => Addnewtransaction(),
      },
    );
  }
}

