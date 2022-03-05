import 'package:flutter/material.dart';
import 'package:cook_lab/Widgets/task_list.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            Text('My Grocery List',
                style: Theme.of(context).textTheme.headline4),
            const SizedBox(height: 20.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 60.0),
                decoration: const BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child:SingleChildScrollView(
                  controller: scrollController,
                  child:Column(
                      children: [
                        Container(child: TaskList(scrollController: scrollController)),
                        const Divider(thickness: 5,),
                        Container(child: TaskList(scrollController: scrollController)),
                      ]
                  ),
                )
              ),),
          ],
        ),
      ),
    );
  }
}
