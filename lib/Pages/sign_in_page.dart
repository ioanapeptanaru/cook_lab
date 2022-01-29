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
              'Log in',
              style: Theme.of(context).textTheme.headline4,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: SignInForm()),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: Text('New to CookLab? Sign up here!'))
          ],
        ),
      ),
    );
  }
}
