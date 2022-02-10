import 'package:cook_lab/Pages/template_page.dart';
import 'package:flutter/material.dart';
import 'package:cook_lab/Forms/todo_list.dart';

class GroceryListPage extends TemplatePage {

  @override
  Widget getBody() {
    return ToDoList();
  }
}
