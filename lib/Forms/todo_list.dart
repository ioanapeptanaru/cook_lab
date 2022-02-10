// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cook_lab/Widgets/task_list.dart';

class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 80.0),
        child: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => Container(
                    color: Colors.white12,
                    child: Container(
                      padding: EdgeInsets.all(40.0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0))),

                      child: Column(
                        children: [
                          Text('Add item',
                          style: Theme.of(context).textTheme.headline4,),
                          TextField(
                            textAlign: TextAlign.center,
                            autofocus: true,
                          ),
                          SizedBox(height: 20,),
                          ElevatedButton(onPressed: (){}, child: Text('Add item'))
                        ],
                      ),
                    )));
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: <Widget>[
            Text('My Grocery List',
                style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: TaskList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
