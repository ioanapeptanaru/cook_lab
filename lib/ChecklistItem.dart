

class ChecklistItem
{
  int index;
  String title;
  bool toggleState;

  ChecklistItem({
    required this.index,
    required this.title,
    required this.toggleState
  });

  int compareWith(ChecklistItem other)
  {
    if(toggleState == true && other.toggleState == false)
    {
      return 1;
    }
    else{
      if(toggleState == other.toggleState)
      {
        return 0;
      }
      else
      {
        return -1;
      }
    }

  }
}