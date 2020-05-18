import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rec extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Rec();
  }
}

class _Rec extends State<Rec> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Record')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Visits').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = Record.fromSnapshot(data);
    String words = 'Name:' +
        record.Name +
        '\nRelationship:' +
        record.Relationship +
        '\nTime of Entry' +
        record.date1.toString() +
        '\nTimeof Departure: ' +
        record.date2.toString();
    return Padding(
      key: ValueKey(record.Name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: ListTile(
              title: Text(record.Name),
              trailing: Text(record.Relationship),
              onTap: () => showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Visit'),
                        content: Text(words),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  ))),
    );
  }
}

class Record {
  final String Name;
  final Timestamp date1;
  final Timestamp date2;
  final String Relationship;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['Name'] != null),
        assert(map['date1'] != null),
        assert(map['date2'] != null),
        assert(map['Relationship'] != null),
        Name = map['Name'],
        date1 = map['date1'],
        date2 = map['date2'],
        Relationship = map['Relationship'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$Name:$date1:$date2:$Relationship>";
}
