import 'package:cook_lab/ChecklistItem.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {

  ChecklistItem item;
  void Function(bool, int) onToggle;

  TaskTile({required this.item, required this.onToggle});

  @override
  State<TaskTile> createState() => TaskTileState();
}

class TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.item.toggleState,
      onChanged: (value) {
        setState(() {
          if (!value!) {
            widget.item.toggleState = false;
          } else {
            widget.item.toggleState = true;
          }
          widget.onToggle(widget.item.toggleState, widget.item.index);
        });
      },
      title: _strikeThrough(
          todoToggle: widget.item.toggleState,
          todoText: widget.item.title
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

class _strikeThrough extends StatelessWidget {
  bool todoToggle;
  String todoText;

  _strikeThrough({required this.todoToggle, required this.todoText}) : super();

  Widget _strikeWidget() {
    if (todoToggle == false) {
      return Text(
        todoText,
        style: const TextStyle(fontSize: 22.0),
      );
    } else {
      return Text(
        todoText,
        style: const TextStyle(
          fontSize: 22.0,
          decoration: TextDecoration.lineThrough,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _strikeWidget();
  }
}
