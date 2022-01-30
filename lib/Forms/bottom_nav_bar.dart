import 'package:cook_lab/Pages/app_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:cook_lab/Pages/category_page.dart';
import 'package:cook_lab/Pages/favorites_page.dart';
import 'package:cook_lab/Pages/grocerylist_page.dart';
import 'package:cook_lab/Pages/profile_page.dart';
import 'package:cook_lab/Pages/search_page.dart';

class BottomNavBar extends StatefulWidget {
  final void Function(int) onPageChange;
  final int index;

  const BottomNavBar({Key? key, required this.onPageChange, required this.index}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final screens = [
    ProfilePage(),
    SearchPage(),
    CategoryPage(),
    FavoritesPage(),
    GroceryListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.person, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.favorite, size: 30),
      Icon(Icons.fact_check_outlined, size: 30),
    ];

    return Theme(
      data: Theme.of(context)
          .copyWith(iconTheme: IconThemeData(color: Colors.white)),
      child: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.transparent,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        index: widget.index,
        items: items,
        onTap: (index) => onIndexChanged(index) //setState(() => this.index = index),
      ),
    );
  }
  
  void onIndexChanged(int index)
  {
      widget.onPageChange(index);
  }
}