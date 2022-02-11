import 'package:flutter/material.dart';
import 'package:cook_lab/Forms/sign_in_form.dart';
import 'package:cook_lab/Pages/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {

    const BoxDecoration logoDecoration =
        BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
          ),
    );

    Text loginText =  Text(
        'Log in',
        style: Theme.of(context).textTheme.headline4,
    );

    TextButton signupBtn = TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpPage())
          );
        },
        child:
          const Text('New to CookLab? Sign up here!')
    );

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            const SizedBox(height: 100,),
            Container(
              height: 120.0,
              width: 120.0,
              decoration: logoDecoration,
            ),
            const SizedBox(
              height: 20,
            ),
            loginText,
            const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SignInForm()),
            signupBtn
          ],
        ),
      ),
    );
  }
}
