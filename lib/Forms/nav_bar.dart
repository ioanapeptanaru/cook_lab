import 'package:flutter/material.dart';
import 'package:cook_lab/Pages/app_page.dart';
import 'package:cook_lab/Enums/pages_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:cook_lab/Enums/themes_enum.dart';

enum NavigationItem { HOME, PROFILE, FAVORITES }

class NavBar extends StatefulWidget {


  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  String _currentTheme = PrefTheme.DEFAULT.toString();

  @override
  void initState() {
    super.initState();
    getSetting();
  }

  void getSetting() async
  {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentTheme = prefs.getString('theme') ?? PrefTheme.DEFAULT.toString();
    });
    debugPrint("theme is : " + _currentTheme.toString());
  }

  void setDarkMode(bool value) async
  {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if(value) {
        _currentTheme = PrefTheme.DARK.toString();
        prefs.setString('theme', _currentTheme);
        Get.changeThemeMode(ThemeMode.dark);
      } else {
        _currentTheme = PrefTheme.LIGHT.toString();
        prefs.setString('theme', _currentTheme);
        Get.changeThemeMode(ThemeMode.light);
      }
    });
    debugPrint("theme is : " + _currentTheme);
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Emily Sanchez'),
              accountEmail: Text('emily.sanchez@gmail.com'),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              //child: Icon(Icons.person, size: 50),
              child: Image.asset('assets/images/chef.png',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              ),

            ),
          ),),

          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
            onTap: (){_onMenuItemClicked(NavigationItem.PROFILE, context);},
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: (){_onMenuItemClicked(NavigationItem.HOME, context);},
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Saved Recipes'),
            onTap: (){_onMenuItemClicked(NavigationItem.FAVORITES, context);},
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: Get.isDarkMode ? true : false,
            onChanged: (bool value){
              setDarkMode(value);
            },
            secondary: Icon(Icons.settings),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log out'),
            onTap: (){},
          ),
        ],
      ),
    );
  }

  void _onMenuItemClicked(NavigationItem item, BuildContext context) {

    if (item == NavigationItem.HOME) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AppPage(pageIndex: PAGE.Category.index)));
    }

    if (item == NavigationItem.PROFILE) {
    Navigator.push(
    context, MaterialPageRoute(builder: (context) => AppPage(pageIndex: PAGE.Profile.index,)));
    }

    if (item == NavigationItem.FAVORITES) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AppPage(pageIndex: PAGE.Favorites.index,)));
    }

  }

}
