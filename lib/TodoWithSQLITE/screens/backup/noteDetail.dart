import 'package:FlutterChallenge/TodoWithSQLITE/models/core/DataBaseHelperNote.dart';
import 'package:FlutterChallenge/TodoWithSQLITE/models/note.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  String appBarTitle; //variavel para receber o nome da nota a partir notelist
  final Note note; //VAriavel criada para receber a nota a partir do noteList

  NoteDetail(this.note, this.appBarTitle); //Construtor

  @override
  _NoteDetailState createState() =>
      _NoteDetailState(this.note, this.appBarTitle);
}

class _NoteDetailState extends State<NoteDetail> {
  //Nase de Dados
  DatabaseHelper databaseHelperNote = DatabaseHelper();

  static var _priorities = ['Hight', 'Low'];
  String appBarTitle;
  Note note;

  TextEditingController titleController =
      TextEditingController(); //Para controlar caixas de textos
  TextEditingController descriptionController = TextEditingController();
  _NoteDetailState(this.note, this.appBarTitle);

  //metodo para volta na ultima com confirmacao de que algo foi alterado
  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    //Atribue-se aos controladores os valores da nota recebida
    titleController.text = note.title;
    descriptionController.text = note.description;

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
              title: Text(appBarTitle),
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  moveToLastScreen();
                },
              )),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: DropdownButton(
                    items: _priorities.map((String dropDownStringItems) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItems,
                        child: Text(dropDownStringItems),
                      );
                    }).toList(),
                    style: textStyle,
                    value: getPriorityAsString(note.priority),
                    onChanged: (valueSelectedByUser) {
                      setState(() {
                        debugPrint('User selected $valueSelectedByUser');
                        updatePriorityAsInt(valueSelectedByUser);
                      });
                    },
                  ),
                ),

                //Second Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: titleController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Fiel $value');
                      updateTitle();
                    },
                    decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: descriptionController,
                    style: textStyle,
                    onChanged: (value) {
                      debugPrint(
                          'Something changed in Descriptio Text Fiel $value');
                      updateDescription();
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 15.0,
                    bottom: 15.0,
                  ),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Save',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint('Save Button clicked');
                            });
                            _save();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            'Delete',
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint('Delete Button clicked');
                              _delete();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onWillPop: () {
          moveToLastScreen();
        });
  }

//Metodo que transforma uma prioridade String em int
  void updatePriorityAsInt(String value) {
    switch (value) {
      case 'High':
        note.priority = 1;
        break;
      case 'Low':
        note.priority = 2;
        break;
    }
  }

  String getPriorityAsString(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = _priorities[0];
        break;
      case 2:
        priority = _priorities[1];
    }

    return priority;
  }

  //Para actualizar o titulo da nota
  void updateTitle() {
    note.title = titleController.text;
  }

  //Para actualizar a descricao da nota
  void updateDescription() {
    note.description = descriptionController.text;
  }

  void _save() async {
    moveToLastScreen();
    //Insere a data com base
    note.date = DateFormat.yMMMd().format(DateTime.now());

    int _result;
    if (note.id != null) {
      _result = await databaseHelperNote.updateNote(note);
    } else {
      _result = await databaseHelperNote.insertNote(note);
    }

    if (_result != 0) {
      _showAlterDialog('Status', 'Note Saved Successfuly');
    } else {
      _showAlterDialog('Status', 'Problema Saving Mode');
    }
  }

  void _showAlterDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void _delete() async {
    moveToLastScreen();
    //Case 1: if user is trying to delete the New Note i.e hr has come to
    //The detail page by pressing the FAB of NoteList page
    if (note.id == null) {
      _showAlterDialog('Status', 'No note was delete');
      return;
    }

    //Case 2: User is trying to delete the old note that alread has a valid id
    int result = await databaseHelperNote.deleteNote(note.id);

    if (result != 0) {
      _showAlterDialog('Status', 'Note deleted sucessfuly');
    } else {
      _showAlterDialog('Status', 'Error Occured while Delecting Note');
    }
  }
}
