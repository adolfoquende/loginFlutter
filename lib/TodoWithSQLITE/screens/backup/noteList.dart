import 'package:FlutterChallenge/TodoWithSQLITE/screens/note_detail.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:FlutterChallenge/TodoWithSQLITE/models/note.dart';
import 'package:FlutterChallenge/TodoWithSQLITE/models/core/DataBaseHelperNote.dart';

class NoteList extends StatefulWidget {
  DatabaseHelper databaseHelperNote = DatabaseHelper();
  List<Note> noteList;
  int count;

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelperNote = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateToDetail(Note('', '', 2), 'Add Note');
        },
        tooltip: 'Add note', //Para mostrar notas quando pressionar lingamente
        child: Icon(Icons.add),
      ),
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelperNote.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelperNote.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }

  ListView getNotesListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor:
                        getPriorityColor(this.noteList[position].priority),
                    child: getPriorityIcon(this.noteList[position].priority)),
                title: Text(
                  this.noteList[position].title,
                  style: titleStyle,
                ),
                subtitle: Text(this.noteList[position].date),
                trailing: GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    _delete(context, noteList[position]);
                  },
                ),
                onTap: () {
                  debugPrint('ListTile Tapped');
                  navigateToDetail(noteList[position], 'Edit Note');
                },
              ));
        });
  }

  void navigateToDetail(Note note, String title) async {
    bool result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => NoteDetail(note, title)));
    if (result == true) {
      updateListView();
    }
  }

  Color getPriorityColor(int priority) {
    switch (priority) {
      case 1:
        return Colors.red;
        break;
      case 2:
        return Colors.yellow;
        break;
      default:
        return Colors.white;
    }
  }

  Icon getPriorityIcon(int priority) {
    switch (priority) {
      case 1:
        return Icon(Icons.play_arrow);
        break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
        break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  //Funcao que apaga uma determinada nota
  void _delete(BuildContext context, Note note) async {
    int result = await databaseHelperNote.deleteNote(note.id);
    if (result != 0) {
      _showSnackBar(context, 'Note Deleted Succesfuly');
      updateListView();
    }
  }

  //Para mostrar a messagem quando uma nota é apaga!
  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
