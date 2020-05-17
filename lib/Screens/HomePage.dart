
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:homeapp/Screens/Rec.dart';
import 'MonitoringPage.dart';
import 'Notifications.dart';
import 'Rec.dart';

class HomePage extends StatefulWidget{
 
  HomePage(FirebaseAuth user, {Key key}) : super(key: key);
  final FirebaseAuth user=FirebaseAuth.instance;
  @override 
  _MyHomePageState  createState()  => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<String>listof=['Monitoring Page','Notifications','Records'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('HomePage'),
        actions: <Widget>[
          new IconButton (icon: new Icon(Icons.notifications),
              onPressed: ()=>Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Notifications(),
            )
          )),
          new IconButton(
            icon: new Icon(Icons.search),
            onPressed: ()=>debugPrint('Search'),
          )
        ]
      ),

      body: new Card(
       child: ListView.builder(
         itemCount:listof.length,
            itemBuilder: (context,index) 
             {
    var post = listof[index];
                return ListTile(
                  title: Text(post),
      onTap: (){
        if(index==0){
          new CircleAvatar(
             child: new Text(listof[0]
             ),
          backgroundColor: Colors.cyan,
          foregroundColor:Colors.white );
Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MonitoringPage(),
            )
          );
        }

   else if(index==1){
     new CircleAvatar(
             child: new Text(listof[0]
             ),
          backgroundColor: Colors.cyan,
          foregroundColor:Colors.white );
    Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Notifications(),
            )
          );
}
else{
  new CircleAvatar(
             child: new Text(listof[2]
             ),
          backgroundColor: Colors.cyan,
          foregroundColor:Colors.white );
  Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Rec(),
            )
          );
}

      },
    );
  },
            // =>listDataItem(this.listof[index]),)

         )),
      floatingActionButton: new FloatingActionButton(onPressed: ()=>debugPrint('FB Button Click'),
        child: new Icon(Icons.live_help),
       backgroundColor: Colors.cyan,
       foregroundColor: Colors.white),
    );

  }

}



class listDataItem extends StatelessWidget {

  String itemName;

  listDataItem(this.itemName);
  
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap:
            () {},//=> getItemAndNavigate(itemName,listof, context),

      child:new Card(
      elevation: 7.0,
      child: new Container(
        margin: EdgeInsets.all(7.0),
        padding: EdgeInsets.all(6.0),

      child: new Row(
        children:<Widget>[
           new CircleAvatar(
             child: new Text(itemName[0]
             ),
          backgroundColor: Colors.cyan,
          foregroundColor:Colors.white ,),
             new  Padding(padding: EdgeInsets.all(8.0)),
             new Text(itemName,style: TextStyle(fontSize:20.0),
           ),
          ]
      ),

    )
           )

           );
  }


}

