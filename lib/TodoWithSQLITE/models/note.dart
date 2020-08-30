class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  //Construtores
  Note(this._title, this._date, this._priority, [this._description]);
  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  int get priority => _priority;

  set priority(int value) {
    if (value >= 1 && value <= 2) _priority = value;
  }

  String get date => _date;

  set date(String value) {
    _date = value;
  }

  String get description => _description;

  set description(String value) {
    if (value.length <= 255) _description = value;
  }

  String get title => _title;

  set title(String value) {
    if (value.length <= 255) _title = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = priority;
    map['date'] = _date;

    return map;
  }

  Note.fromMap(Map<String, dynamic> map) {
    this._date = map['date'];
    this._id = map['id'];
    this._priority = map['priority'];
    this._description = map['description'];
    this._title = map['title'];
  }
}
