import 'package:flutter/material.dart';
import 'package:zoomclone/firestoremethods.dart';

class prevmeeting extends StatelessWidget {
  const prevmeeting({super.key});

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator());
      }
      return ListView.builder(itemCount: (snapshot.data! as dynamic).docs.length,itemBuilder: (context,index)=>ListTile(title: Text('room name : ${(snapshot.data! as dynamic).docs[index]['meeting name']}'),subtitle: Text("Joined on : ${(snapshot.data! as dynamic).docs[index]['createdat']}"),));
    },stream: firestore().meetingshistory,);
  }
}
