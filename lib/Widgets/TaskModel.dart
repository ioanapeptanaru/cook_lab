class TaskModel
{
  bool checked = false;
  String name = "";

  TaskModel({this.checked = false, this.name = ""});
  TaskModel.withName(this.name, {this.checked = false});
}