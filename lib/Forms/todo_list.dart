// ignore_for_file: prefer_const_constructors

import 'package:cook_lab/ChecklistItem.dart';
import 'package:cook_lab/Widgets/task_tile.dart';
import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {

  var itemsList = [
    ChecklistItem(index: 0, title: "Milk", toggleState: false),
    ChecklistItem(index: 1, title: "Bread", toggleState: false),
    ChecklistItem(index: 2, title: "Jam", toggleState: true),
    ChecklistItem(index: 3, title: "Coffee", toggleState: false),
  ];

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  @override
  Widget build(BuildContext context) {

    sortListAfterState();

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 80.0),
        child: _getFloatingActionButton()
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
                child: ListView(
                  children: [
                    for(int i = 0; i<widget.itemsList.length; i++)
                    TaskTile(
                        item: widget.itemsList.elementAt(i),
                        onToggle: onItemToggle
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onItemToggle(bool toggleState, int index)
  {
    setState(() {
      widget.itemsList.elementAt(index).toggleState = toggleState;
    });
  }

  void sortListAfterState()
  {
    widget.itemsList.sort((a,b) =>
        a.title.compareTo(b.title)
    );

    widget.itemsList.sort((a,b) =>
        a.compareWith(b)
    );

    for(int i=0; i<widget.itemsList.length; i++)
    {
      widget.itemsList.elementAt(i).index = i;
    }
  }

  Widget _getFloatingActionButton()
  {

    Text addItemTitle = Text(
        'Add item',
        style: Theme.of(context).textTheme.headline4
    );

    final myController = TextEditingController();

    TextField newItemEditText = TextField(
        textAlign: TextAlign.center,
        autofocus: true,
        controller: myController
    );

    ElevatedButton addItemBtn = ElevatedButton(
        onPressed: (){
          Navigator.pop(context);
          onItemAdded(myController.text);
        },
        child: Text('Add item')
    );

    return FloatingActionButton(
      child: const Icon(
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
                          topRight: Radius.circular(20.0)
                      )
                  ),
                  child: Column(
                    children: [
                      addItemTitle,
                      newItemEditText,
                      SizedBox(height: 20),
                      addItemBtn
                    ],
                  ),
                )
            )
        );
      },
    );
  }

  void onItemAdded(String title)
  {
    ChecklistItem newItem = ChecklistItem(
        index: 0, title: title, toggleState: false
    );

    setState(() {
      widget.itemsList.add(newItem);
    });
  }
}
