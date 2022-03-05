import 'package:flutter/material.dart';
import 'package:cook_lab/Widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  ScrollController scrollController;


  TaskList({required this.scrollController, Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  final List<int> _items = List<int>.generate(15, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      buildDefaultDragHandles: false,
      children: <Widget>[
        for (int index = 0; index < _items.length; index++)
          Container(
            key: ValueKey(index),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              leading: const Icon(Icons.lock_clock),
              title: Text(
                "Item ${_items[index]}",
                style: const TextStyle(fontSize: 24),
              ),
              trailing: ReorderableDragStartListener(
                  index: index,
                  child: const Icon(Icons.drag_handle_outlined),
              )
            )
          ),
      ].toList(),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }
}
