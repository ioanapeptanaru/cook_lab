import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:cook_lab/Buttons/validate_button.dart';
import 'package:cook_lab/Pages/sign_up_page.dart';
import 'package:cook_lab/Pages/sign_in_page.dart';

class OnBoardingPage extends StatefulWidget {

  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  void _afterIntroScreen(BuildContext context, {required bool isNewMember}) async
  {
    Navigator.pop(context);
    if(isNewMember)
    {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignUpPage()));
    }
    else
    {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignInPage()));
    }
    final SharedPreferences prefs =  await SharedPreferences.getInstance();
    prefs.setBool("shownIntroScreen", true);
  }

  @override
  Widget build(BuildContext context) {
    SubmitButton _newBtn = SubmitButton(
      onPressed: () {
        _afterIntroScreen(context, isNewMember: true);
      },
      child: Text('New member?'),
    );

    SubmitButton _loginBtn = SubmitButton(
      onPressed: () {
        _afterIntroScreen(context, isNewMember: false);
      },
      child: Text('Already have an account?'),
    );

    return Scaffold(
      body: IntroductionScreen(
        showDoneButton: false,
        showNextButton: true,
        showSkipButton: true,
        next: Text('Next'),
        skip: Text('Skip'),
        pages: [
          PageViewModel(
            image: Image.asset('assets/images/cooking.png', width: 300),
            title: 'Welcome to CookLab!',
            body: 'A modern cookbook designed to make your life easier',

            //AssetImage('assets/images/logo.png')
          ),
          PageViewModel(
            image: Image.asset('assets/images/girl.png', width: 300),
            title: 'Make a delicious meal only with what you have',
            body:
                'Few ingredients and no idea how to combine them? \nAsk CookLab!',
          ),
          PageViewModel(
            image: Image.asset('assets/images/fav.png', width: 300),
            title: 'Save your favourites dishes from news feed',
            body:
                'Seen an interesting recipe but you don`t have all ingredients?\nSave it for later!',
          ),
          PageViewModel(
            image: Image.asset('assets/images/shopping.png', width: 300),
            title: 'Keep your grocery list handy!',
            body: 'Save paper and adopt a reusable list!',
          ),
          PageViewModel(
            image: Image.asset('assets/images/mancooking.png', width: 300),
            title: 'Ready to cook?',
            body: '',
            footer: Column(children: [
              _newBtn,
              _loginBtn,
            ]),
          ),
        ],
      ),
    );
  }
}
