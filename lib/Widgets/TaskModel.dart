class TaskModel
{
  bool checked = false;
  String name = "";

  TaskModel({this.checked = false, this.name = ""});
  TaskModel.withName(this.name, {this.checked = false});

  TaskModel.fromString(String objStr){
  this.name = objStr.substring(0, objStr.length-1);
  this.checked = objStr.endsWith("1");
  }

  @override
  String toString() {
    int numCheck = checked ? 1 : 0;
    return "${name}${numCheck}";
  }
}