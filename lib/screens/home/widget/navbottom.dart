import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:money_manager/screens/home/screen_home.dart';

class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder(

      valueListenable: ScreenHome.index,

      builder: (BuildContext ctx, int newindex, Widget? _){
        return BottomNavigationBar(
          currentIndex: newindex,

          onTap: (value){
            ScreenHome.index.value=value;
          },
          selectedItemColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Transactions"),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined),
              label: "Categories")
          ]
        );
      },
    );
  }
}