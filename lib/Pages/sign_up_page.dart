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
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            SizedBox(height: 100,),
            Container(
              height: 120.0,
              width: 120.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Sign up',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SignUpForm()),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
                child: Text('Already have an account? Sign in here!'))
          ],
        ),
      ),
    );
  }
}
