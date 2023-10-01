import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:uygulama1/pages/home/furniture_page.dart';
import 'package:uygulama1/utils/colors.dart';
import 'package:uygulama1/pages/cart/cart_history.dart ';


class HomePage extends StatefulWidget {
  //import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart'; persistent_bottom_nav_bar: ^5.0.2
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0;
  //late PersistentTabController _controller;

  List pages=[
    FurniturePage(),
    Container(child:Center(child:Text("Next Page"))),
    CartHistory(),
    Container(child:Center(child:Text("Next next next Page"))),
  ];

  void onTapNav(int index){
     setState(() {
       _selectedIndex=index;
     });
  }

  /*@override
  void initState(){
    super.initState();
    _controller=PersistentTabController(initialIndex:0);

  }*/
 /* List<Widget> _buildScreens() {
    return [
      FurniturePage(),
      Container(child:Center(child:Text("Next Page"))),
      Container(child:Center(child:Text("Next next Page"))),
      Container(child:Center(child:Text("Next next next Page"))),

    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox_fill),
        title: ("Archive"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("Cart"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Me"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.mainColor,
          unselectedItemColor: Colors.amberAccent,
          showSelectedLabels: false,
          showUnselectedLabels: false ,
          selectedFontSize: 0.0,
          unselectedFontSize: 0.0,
          currentIndex: _selectedIndex,
          onTap: onTapNav ,
          items: const [
             BottomNavigationBarItem(
               icon: Icon(Icons.home_outlined,),
               //geçişten önce->title:Text("home"),sonra->
               label: "home"

             ),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive,),
                label: "history"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart,),
                label: "cart"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person,),
                label: "me"
            ),

        ],
        ),
    );
  }

}





