import 'package:flutter/material.dart';

enum Confirmation { Cancel, Accept }

class MonitoringPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
    'Allow or Deny Entry'
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
      body: new Card(
          child: ListView.builder(
        itemCount: listof.length,
        itemBuilder: (context, index) {
          var post = listof[index];
          return ListTile(
            title: Text(post),
            onTap: () {
              if (index == 0) {
                Card(
                    child: new CircleAvatar(
                        child: new Text(listof[0]),
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white));
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Leaving Home'),
                      content: const Text(
                          'This will reset your devices on alert and all doors closed.'),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: const Text('ACCEPT'),
                          onPressed: () {
                            Navigator.push(context, _ackAlert(context));
                          },
                        )
                      ],
                    );
                  },
                ));
              } else if (index == 1) {
                Card(
                    child: new CircleAvatar(
                        child: new Text(listof[1]),
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white));
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AlertDialog(
                    title: Text('Entering Home'),
                    content: const Text(
                        'This will reset your devices on alert and all doors closed.'),
                    actions: <Widget>[
                      FlatButton(
                        child: const Text('CANCEL'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: const Text('ACCEPT'),
                        onPressed: () {
                          Navigator.push(context, _ackAlert4(context));
                        },
                      )
                    ],
                  );
                }));
              } else if (index == 2) {
                Card(
                    child: new CircleAvatar(
                        child: new Text(listof[2]),
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white));
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Bed Time'),
                      content: const Text(
                          'This will reset your devices on alert and all doors closed.'),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: const Text('ACCEPT'),
                          onPressed: () {
                            Navigator.push(context, _ackAlert3(context));
                          },
                        )
                      ],
                    );
                  },
                ));
              } else if (index == 3) {
                Card(
                  child: new CircleAvatar(
                      child: new Text(listof[3]),
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.white),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Awake'),
                        content: const Text(
                            'This will reset your devices on alert and all doors closed.'),
                        actions: <Widget>[
                          FlatButton(
                            child: const Text('CANCEL'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: const Text('ACCEPT'),
                            onPressed: () {
                              Navigator.push(context, _ackAlert2(context));
                            },
                          )
                        ],
                      );
                    },
                  ),
                );
              } else {
                Card(
                    child: new CircleAvatar(
                        child: new Text(listof[4]),
                        backgroundColor: Colors.cyan,
                        foregroundColor: Colors.white));
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Allow Entry'),
                      content: const Text(
                          'This will allow doors to open automatically.'),
                      actions: <Widget>[
                        FlatButton(
                          child: const Text('CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: const Text('ACCEPT'),
                          onPressed: () {
                            Navigator.push(context, _ackAlert1(context));
                          },
                        )
                      ],
                    );
                  },
                ));
              }
            },
          );
        },
        // =>listDataItem(this.listof[index]),)
      )),
      floatingActionButton: new FloatingActionButton(
          onPressed: () => debugPrint('FB Button Click'),
          child: new Icon(Icons.live_help),
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.white),
    );
  }
}

_ackAlert1(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Allow Entry'),
        content: const Text('Door Opened'),
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
  );
}

_ackAlert2(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Awake'),
        content: const Text('Devices and Door are relaxed'),
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
  );
}

_ackAlert3(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Bed Time'),
        content: const Text('Devices and Door Locked'),
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
  );
}

_ackAlert4(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Entering Home'),
        content: const Text('Devices and Door are relaxed'),
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
  );
}

_ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Leaving Home'),
        content: const Text('Devices and Door Locked'),
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
  );
}
