import 'package:flutter/material.dart';

bool toggle = false;

class _strikeThrough extends StatelessWidget {
  bool todoToggle;
  String todoText;

  _strikeThrough({required this.todoToggle, required this.todoText}) : super();

  Widget _strikewidget() {
    if (todoToggle == false) {
      return Text(
        todoText,
        style: TextStyle(fontSize: 22.0),
      );
    } else {
      return Text(
        todoText,
        style: TextStyle(
          fontSize: 22.0,
          decoration: TextDecoration.lineThrough,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _strikewidget();
  }
}

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => TaskTileState();
}

class TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: toggle,
      onChanged: (bool) {
        setState(() {
          if (!bool!) {
            toggle = false;
          } else {
            toggle = true;
          }
        });
      },
      title: _strikeThrough(todoText: 'Milk', todoToggle: toggle),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
