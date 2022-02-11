import 'package:flutter/material.dart';
import 'package:cook_lab/Pages/app_page.dart';
import 'package:cook_lab/Enums/pages_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:cook_lab/Enums/themes_enum.dart';

enum NavigationItem { HOME, PROFILE, FAVORITES }

class NavBar extends StatefulWidget {

  AppPageState mainPagePtr;

  NavBar({required this.mainPagePtr, Key? key}) : super(key: key);

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
              accountName: const Text('Emily Sanchez'),
              accountEmail: const Text('emily.sanchez@gmail.com'),
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
            leading: const Icon(Icons.person),
            title: const Text('My Profile'),
            onTap: (){_onMenuItemClicked(NavigationItem.PROFILE, context);},
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: (){_onMenuItemClicked(NavigationItem.HOME, context);},
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Saved Recipes'),
            onTap: (){_onMenuItemClicked(NavigationItem.FAVORITES, context);},
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: Get.isDarkMode ? true : false,
            onChanged: (bool value){
              setDarkMode(value);
            },
            secondary: const Icon(Icons.settings),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Log out'),
            onTap: (){},
          ),
        ],
      ),
    );
  }

  void _onMenuItemClicked(NavigationItem item, BuildContext context) {

    if (item == NavigationItem.HOME) {
      widget.mainPagePtr.onPageChange(2);
    }

    if (item == NavigationItem.PROFILE) {
      widget.mainPagePtr.onPageChange(0);
    }

    if (item == NavigationItem.FAVORITES) {
      widget.mainPagePtr.onPageChange(3);
    }

  }

}
