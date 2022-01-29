import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {

  SubmitButton({Key? key, this.onPressed, this.child, this.style}) : super(key: key);

  void Function()? onPressed;
  Widget? child;
  ButtonStyle? style;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: child, style: style,);
  }
}
