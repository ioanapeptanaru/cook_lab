import 'package:cook_lab/Buttons/validate_button.dart';
import 'package:cook_lab/Pages/app_page.dart';
import 'package:flutter/material.dart';
import 'package:cook_lab/Fields/text_field_widget.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {


    TextFieldWidget _nameField = TextFieldWidget(
      controller: nameController,
      icon: const Icon(Icons.person),
      labelText: "Username",
      obscureText: false,
    );

    TextFieldWidget _passwordField = TextFieldWidget(
      controller: passwordController,
      obscureText: _isHidden,
      icon: const Icon(Icons.lock),
      labelText: "Password",
      suffix: InkWell(
        onTap: _togglePasswordView,
        child: Icon(
          _isHidden ? Icons.visibility_off : Icons.visibility,
        ),
      ),
    );

    SubmitButton _signinBtn = SubmitButton(
      onPressed: () {
        debugPrint('Username is "${_nameField.fieldContent.text}"');
        debugPrint('Password is "${_passwordField.fieldContent.text}"');

        if (_formKey.currentState!.validate()) {
          Navigator.pop(context);
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => AppPage()));
        }
      },
      child: const Text('Log in'),
    );

    return Form(
      key: _formKey,
      child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              _nameField,
              SizedBox(height: 10,),
              _passwordField,
              SizedBox(height: 20,),
              _signinBtn,

            ],
          ),
        ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
