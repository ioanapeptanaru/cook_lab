import 'package:cook_lab/Widgets/TaskModel.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  TaskModel currentTask;
  int index;
  void Function(bool) onStateChange;
  void Function()? onDelete;
  void Function(String) onTextChanged;

  TaskTile(
      {Key? key,
      required this.index,
      required this.currentTask,
      required this.onStateChange,
      required this.onTextChanged,
      this.onDelete})
      : super(key: key);

  @override
  State<TaskTile> createState() => TaskTileState();
}

class TaskTileState extends State<TaskTile> {
  Widget _checkedBox() {
    return Card(
      child: ListTile(
        title: Row(children: [
          Expanded(
              child: _StrikeThrough(
                  onTextChanged: widget.onTextChanged,
                  todoText: widget.currentTask.name,
                  todoToggle: widget.currentTask.checked)),
        ]),
        leading: SizedBox(
          width: 72,
          child: Row(children: [
            const SizedBox(
              width: 24,
            ),
            Checkbox(
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
          ]),
        ),

        //controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  Widget _nonCheckedBox() {
    return Card(
      child: ListTile(
        trailing: IconButton(
            onPressed: () {
              widget.onDelete!();
            },
            icon: const Icon(Icons.close)),
        title: Row(children: [
          Expanded(
              child: _StrikeThrough(
                  onTextChanged: widget.onTextChanged,
                  todoText: widget.currentTask.name,
                  todoToggle: widget.currentTask.checked)),
        ]),
        leading: SizedBox(
          width: 72,
          child: Row(children: [
            ReorderableDragStartListener(
              index: widget.index,
              child: const Icon(Icons.drag_indicator),
            ),
            Checkbox(
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
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.currentTask.checked) {
      return _checkedBox();
    } else {
      return _nonCheckedBox();
    }
  }
}

class _StrikeThrough extends StatefulWidget {
  bool todoToggle;
  String todoText;
  void Function(String) onTextChanged;

  _StrikeThrough(
      {Key? key,
      required this.todoToggle,
      required this.todoText,
      required this.onTextChanged})
      : super(key: key);

  @override
  State<_StrikeThrough> createState() => _StrikeThroughState();
}

class _StrikeThroughState extends State<_StrikeThrough> {
  Widget _strikeWidget() {
    /// checked
    return TextFormField(
      initialValue: widget.todoText,
      style: const TextStyle(
        fontSize: 20.0,
        decoration: TextDecoration.lineThrough,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

  Widget _normalWidget() {
    /// unchecked
    return TextFormField(
        initialValue: widget.todoText,
        onChanged: (value) => widget.onTextChanged(value),
        style: const TextStyle(fontSize: 20.0),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.todoToggle == false) {
      return _normalWidget();
    } else {
      return _strikeWidget();
    }
  }
}
