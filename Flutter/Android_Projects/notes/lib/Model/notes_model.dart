class NotesModel{
  late int _NotesID;
  late String _NotesTitle;
  late String _NotesContent;
  late String _ModifyDate;

  int get NotesID => _NotesID;

  set NotesID(int NotesID) {
    _NotesID = NotesID;
  }


  String get NotesTitle => _NotesTitle;

  set NotesTitle(String NotesTitle) {
    _NotesTitle = NotesTitle;
  }


  String get NotesContent => _NotesContent;

  set NotesContent(String NotesContent) {
    _NotesContent = NotesContent;
  }


  String get ModifyDate => _ModifyDate;

  set ModifyDate(String ModifyDate) {
    _ModifyDate = ModifyDate;
  }
}