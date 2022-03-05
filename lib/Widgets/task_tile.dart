import 'package:flutter/material.dart';

class _StrikeThrough extends StatelessWidget {
  bool todoToggle;
  String todoText;

  _StrikeThrough({required this.todoToggle, required this.todoText}) : super();

  Widget _strikewidget() {
    if (todoToggle == false) {
      return TextFormField(
          initialValue: todoText,
        style: const TextStyle(fontSize: 22.0),
        decoration: const InputDecoration(
          border: InputBorder.none,)

      );
    } else {
      return TextFormField(
        initialValue: todoText,
          style: const TextStyle(
            fontSize: 22.0,
            decoration: TextDecoration.lineThrough,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
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
  String text;

  TaskTile({Key? key, required this.text}) : super(key: key);

  @override
  State<TaskTile> createState() => TaskTileState();
}

class TaskTileState extends State<TaskTile> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(children: [
        Expanded(
            child: _StrikeThrough(todoText: widget.text, todoToggle: toggle)),
      ]),
      leading: Checkbox(
        value: toggle,
        onChanged: (check) {
          setState(() {
            if (!check!) {
              toggle = false;
            } else {
              toggle = true;
            }
          });
        },
      ),

      //controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
