import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: getNotesListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
        },
        tooltip: 'Add note', //Para mostrar notas quando pressionar lingamente
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getNotesListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (context, index) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    child: Icon(Icons.keyboard_arrow_down)),
                title: Text(
                  'Dummy title',
                  style: titleStyle,
                ),
                subtitle: Text('Dummy Date'),
                trailing: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
                onTap: () {
                  debugPrint('');
                },
              ));
        });
  }
}
