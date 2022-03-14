import 'package:cook_lab/Widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'TaskModel.dart';

class TaskList extends StatefulWidget {
  final List<TaskModel> _nonChecked = List<TaskModel>.empty(growable: true);
  final List<TaskModel> _checked = List<TaskModel>.empty(growable: true);

  TaskList();

  @override
  State<TaskList> createState() => _TaskListState();
}
// TaskModel

class _TaskListState extends State<TaskList> {

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    loadSharedPreferencesAndData();
    super.initState();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    // get the string list from internal storage
    var strList = sharedPreferences.getStringList('tasklist') ?? List<String>.empty(growable: true);
    debugPrint("list size is ${strList.length}");
    // iterating through the list and constructing objects from the strings
    // after that we decide if a object is a checked task or unchecked task
    for(int i = 0; i< strList.length; i++)
      {
        TaskModel e = TaskModel.fromString(strList[i]);
        if(e.checked){
          widget._checked.add(e);
        }
        else{
          widget._nonChecked.add(e);
        }
      }
    setState(() {});
  }

  @override
  void dispose() {
    List<String> savedTasks = List<String>.empty(growable: true);
    for(int i = 0; i<widget._nonChecked.length;i++)
      {
        savedTasks.add(widget._nonChecked.elementAt(i).toString());
      }
    for(int i = 0; i<widget._checked.length;i++)
    {
      savedTasks.add(widget._checked.elementAt(i).toString());
    }
    sharedPreferences.setStringList('tasklist', savedTasks);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController =
        PrimaryScrollController.of(context) ?? ScrollController();
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverReorderableList(
            itemBuilder: (context, index) {
              return TaskTile(
                  key: ValueKey(widget._nonChecked[index].name),
                  index: index,
                  currentTask: widget._nonChecked[index],
                  onStateChange: (newState) =>
                      OnItemStateChanged(index, newState),
                  onDelete: () {
                    setState(() {
                      widget._nonChecked.removeAt(index);
                    });
                  },
                  onTextChanged: (value) => OnTextChanged(value, index, false));
            },
            itemCount: widget._nonChecked.length,
            onReorder: (oldPos, newPos) {
              setState(() {
                if (oldPos < newPos) {
                  newPos -= 1;
                }
                final TaskModel item = widget._nonChecked.removeAt(oldPos);
                widget._nonChecked.insert(newPos, item);
              });
            }),
        SliverToBoxAdapter(
            key: UniqueKey(),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () => OnItemAdd(),
                  icon: const Icon(Icons.add),
                  label: const Text("Add new item"),
                ),
                if (widget._checked.isNotEmpty && widget._nonChecked.isNotEmpty)
                  const Divider(thickness: 5)
              ],
            )),
        SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
          return TaskTile(
              key: ValueKey(widget._checked[index].name),
              index: index,
              currentTask: widget._checked[index],
              onStateChange: (newState) => OnItemStateChanged(index, newState),
              onTextChanged: (value) => OnTextChanged(value, index, true));
        }, childCount: widget._checked.length))
      ],
    );
  }

  void OnTextChanged(String value, int index, bool isChecked) {
    debugPrint("text changed");
    if (isChecked) {
      widget._checked.elementAt(index).name = value;
    } else {
      widget._nonChecked.elementAt(index).name = value;
    }
  }

  void OnItemAdd() {
    setState(() {
      widget._nonChecked.add(TaskModel());
    });
  }

  void OnItemStateChanged(int index, bool newState) {
    if (newState == true) {
      setState(() {
        TaskModel task = widget._nonChecked.removeAt(index);
        widget._checked.add(task);
      });
    } else {
      setState(() {
        TaskModel task = widget._checked.removeAt(index);
        widget._nonChecked.add(task);
      });
    }
    DebugList(widget._nonChecked, "nonChecked");
    DebugList(widget._checked, "Checked");
  }

  void DebugList(List<TaskModel> list, String name) {
    String str = "$name [ ";
    for (int i = 0; i < list.length; i++) {
      if (i != list.length - 1) {
        str += "${list[i].name}, ";
      } else {
        str += list[i].name;
      }
    }
    str += " ]";
    debugPrint(str);
  }




}
