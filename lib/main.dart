import 'package:flutter/material.dart';
import 'package:cook_lab/Pages/onboarding_page.dart';
import 'Pages/sign_in_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'Enums/themes_enum.dart';


void main() async {
  runApp(CookLab());
}


class CookLab extends StatefulWidget {

  @override
  State<CookLab> createState() => _CookLabState();
}

class _CookLabState extends State<CookLab> {

  bool _userState = false;
  String _theme = PrefTheme.DEFAULT.toString();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  void _loadSettings () async
  {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _userState = prefs.getBool('shownIntroScreen') ?? false;
      _theme = prefs.getString("theme") ?? PrefTheme.DEFAULT.toString();
    });
    debugPrint("shownIntroScreen is : " + _userState.toString());
    debugPrint("theme is : " + _theme);
  }

  ThemeMode getSavedTheme()
  {
    if(_theme == PrefTheme.DARK.toString())
      return ThemeMode.dark;
    if(_theme == PrefTheme.LIGHT.toString())
      return ThemeMode.light;
    return ThemeMode.system;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cook Lab',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: getSavedTheme(),
      //home: AppPage(pageIndex: PAGE.Category.index,),
      home: _userState ? SignInPage() : OnBoardingPage(),

      debugShowCheckedModeBanner: false,
    );
  }
}

