import 'package:flutter/material.dart';
import 'package:cook_lab/Forms/sign_up_form.dart';
import 'package:cook_lab/Pages/sign_in_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {

    const BoxDecoration logoDecoration =
        BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logo.png'),
          ),
    );

    Text signupText = Text(
        'Sign up',
        style: Theme.of(context).textTheme.headline4,
    );

    TextButton signinBtn = TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignInPage())
          );
        },
        child:
          const Text('Already have an account? Sign in here!')
    );

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              height: 120.0,
              width: 120.0,
              decoration: logoDecoration
            ),
            const SizedBox(
              height: 20
            ),
            signupText,
            const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SignUpForm()
            ),
            signinBtn
          ],
        ),
      ),
    );
  }
}
