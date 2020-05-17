import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Monitoring Page',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: MyMonitor(title: 'Monitor'),
    );
  }
}

class MyMonitor extends StatefulWidget {
  int index;

  MyMonitor({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyMonitorState createState() => _MyMonitorState(index);
}

class _MyMonitorState extends State<MyMonitor> {
  final List<String> listof = [
    'Leaving Home',
    'Entering Home',
    'Going to Bed',
    'Rise and Shine',
    'Allow or Deny Entry',
    'Add Member of Household',
    'Front Gate'
  ];

  _MyMonitorState(int index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title), actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () => debugPrint('Search'),
          )
        ]),
        body: new Container(
            child: new ListView.builder(
          itemBuilder: (_, int index) => listMonitorItem(this.listof[index]),
          itemCount: this.listof.length,
        )),
        floatingActionButton: new FloatingActionButton(
          onPressed: () => debugPrint('FB Button Click'),
          child: new Icon(Icons.live_help),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
        ));
  }
}

class listMonitorItem extends StatelessWidget {
  String itemName;

  listMonitorItem(this.itemName);
  @override
  Widget build(BuildContext context) {
    return new Card(
        elevation: 7.0,
        child: new Container(
            margin: EdgeInsets.all(7.0),
            padding: EdgeInsets.all(6.0),
            child: new Row(children: <Widget>[
              new CircleAvatar(
                child: new Text(itemName[0]),
                backgroundColor: Colors.cyan,
                foregroundColor: Colors.white,
              ),
              new Padding(padding: EdgeInsets.all(8.0)),
              new Text(
                itemName,
                style: TextStyle(fontSize: 20.0),
              )
            ])));
  }
}
