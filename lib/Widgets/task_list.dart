import 'package:flutter/material.dart';
import 'package:cook_lab/Widgets/task_tile.dart';

import 'TaskModel.dart';

class TaskList extends StatefulWidget {
  final List<TaskModel> _nonChecked = List<TaskModel>.empty(growable: true);
  final List<TaskModel> _checked = List<TaskModel>.empty(growable: true);

  TaskList()
  {
    _nonChecked.add(TaskModel.withName("hello1"));
    _nonChecked.add(TaskModel.withName("hello2"));
    _nonChecked.add(TaskModel.withName("hello3"));
    _nonChecked.add(TaskModel.withName("hello4"));
    _nonChecked.add(TaskModel.withName("hello5"));
    _nonChecked.add(TaskModel.withName("hello6"));
    _nonChecked.add(TaskModel.withName("hello7"));
    _nonChecked.add(TaskModel.withName("hello8"));
    _nonChecked.add(TaskModel.withName("hello9"));
    _nonChecked.add(TaskModel.withName("hello10"));
    _nonChecked.add(TaskModel.withName("hello11"));
    _nonChecked.add(TaskModel.withName("hello12"));
    _nonChecked.add(TaskModel.withName("hello13"));
    _nonChecked.add(TaskModel.withName("hello14"));
    _nonChecked.add(TaskModel.withName("hello15"));
  }


  @override
  State<TaskList> createState() => _TaskListState();
}
// TaskModel

class _TaskListState extends State<TaskList> {



  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController =
                      PrimaryScrollController.of(context) ?? ScrollController();
    return CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverReorderableList(
          itemBuilder: (context, index){
            return TaskTile(
                  key: ValueKey(widget._nonChecked[index].name),
                  index: index,
                  currentTask: widget._nonChecked[index],
                  onStateChange: (newState) => OnItemStateChanged(index, newState))
            ;},
          itemCount:widget._nonChecked.length,
          onReorder: (oldPos, newPos) {
            setState(() {
              if (oldPos < newPos) {
                newPos -= 1;
              }
              final TaskModel item = widget._nonChecked.removeAt(oldPos);
              widget._nonChecked.insert(newPos, item);
            });
          }),

          if(widget._checked.isNotEmpty && widget._nonChecked.isNotEmpty)
          const SliverToBoxAdapter(child: Divider(thickness: 5,)),

          SliverList(delegate:
            SliverChildBuilderDelegate((BuildContext context, int index)
              {
                return TaskTile(
                    key: ValueKey(widget._checked[index].name),
                    index: index,
                    currentTask: widget._checked[index],
                    onStateChange: (newState) => OnItemStateChanged(index, newState));
              },
              childCount: widget._checked.length
          ))
        ],
      );
  }



  void OnItemStateChanged(int index, bool newState)
  {
    if(newState == true) {
      setState(() {
        TaskModel task = widget._nonChecked.removeAt(index);
        widget._checked.add(task);
      });
    }else {
      setState(() {
        TaskModel task = widget._checked.removeAt(index);
        widget._nonChecked.add(task);
      });
    }
      DebugList(widget._nonChecked, "nonChecked");
      DebugList(widget._checked, "Checked");
  }

  void DebugList(List<TaskModel> list, String name)
  {
    String str = "$name [ ";
    for(int i=0; i<list.length; i++)
      {
        if(i!=list.length-1)
          str+="${list[i].name}, ";
        else
          str+="${list[i].name}";
      }
    str+=" ]";
    debugPrint(str);
  }

}
