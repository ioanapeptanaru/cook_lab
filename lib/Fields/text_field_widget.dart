import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  Widget? icon;
  String? labelText;
  Widget? suffix;
  bool? obscureText;
  TextEditingController fieldContent;

  TextFieldWidget(
      {TextEditingController? controller, this.icon, this.labelText = "", this.suffix, this.obscureText})
  : fieldContent = controller ?? TextEditingController();

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.fieldContent,
      obscureText: widget.obscureText!,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: widget.icon,
        suffix: widget.suffix,
        labelText: widget.labelText,
      ),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

}
