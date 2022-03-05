import 'package:cook_lab/Widgets/TaskModel.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  TaskModel currentTask;
  int index;
  void Function(bool) onStateChange;

  TaskTile({Key? key, required this.index, required this.currentTask, required this.onStateChange}) : super(key: key);

  @override
  State<TaskTile> createState() => TaskTileState();
}

class TaskTileState extends State<TaskTile> {

  @override
  Widget build(BuildContext context) {

    if(widget.currentTask.checked){
      return Card(
        child: ListTile(
          title: Row(children: [
            Expanded(
                child: _StrikeThrough(
                    todoText: widget.currentTask.name,
                    todoToggle: widget.currentTask.checked)),
          ]),
          leading: Checkbox(
            value: widget.currentTask.checked,
            onChanged: (check) {
              setState(() {
                if (!check!) {
                  widget.currentTask.checked = false;
                } else {
                  widget.currentTask.checked = true;
                }
              });
              widget.onStateChange(widget.currentTask.checked);
            },
          ),

          //controlAffinity: ListTileControlAffinity.leading,
        ),
      );
    }

    return Card(
      child: ListTile(
        trailing: ReorderableDragStartListener(
          index: widget.index,
          child: Icon(Icons.drag_handle),
        ),
        title: Row(children: [
          Expanded(
              child: _StrikeThrough(
                  todoText: widget.currentTask.name,
                  todoToggle: widget.currentTask.checked)),
        ]),
        leading: Checkbox(
          value: widget.currentTask.checked,
          onChanged: (check) {
            setState(() {
              if (!check!) {
                widget.currentTask.checked = false;
              } else {
                widget.currentTask.checked = true;
              }
            });
            widget.onStateChange(widget.currentTask.checked);
          },
        ),

        //controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}


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
