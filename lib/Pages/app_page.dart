import 'package:cook_lab/Pages/favorites_page.dart';
import 'package:cook_lab/Pages/grocerylist_page.dart';
import 'package:cook_lab/Pages/profile_page.dart';
import 'package:cook_lab/Pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:cook_lab/Forms/nav_bar.dart';
import 'package:cook_lab/Forms/bottom_nav_bar.dart';
import 'category_page.dart';


class AppPage extends StatefulWidget {

  var list = [ProfilePage(), SearchPage(), CategoryPage(), FavoritesPage(), GroceryListPage()];
  var pageIndex;
  // 2 is the initial page opened -> home
  AppPage({Key? key, this.pageIndex = 2}) : super(key: key);

  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends State<AppPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        drawer: NavBar(mainPagePtr: this),
        appBar: AppBar(
          centerTitle: true,
          title: Text("CookLab"),
        ),
        bottomNavigationBar:
            BottomNavBar(index: widget.pageIndex, onPageChange: onPageChange),
        body:
            widget.list.elementAt(widget.pageIndex).getBody()
    );
  }

  void onPageChange(int index)
  {
      setState(() {
        widget.pageIndex = index;
      });
  }

  @override
  void didUpdateWidget(AppPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    onPageChange(oldWidget.pageIndex);
  }
}
