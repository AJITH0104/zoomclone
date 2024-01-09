import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class firestore{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  final FirebaseAuth auth=FirebaseAuth.instance;
Stream get meetingshistory=>_firestore.collection('users').doc(auth.currentUser!.uid).collection('meetings').snapshots();
  void addtomeetinghistory(String meetingname) async{
    try{
      await _firestore.collection('users').doc(auth.currentUser!.uid).collection('meetings').add(
          {
            'meeting name':meetingname,
            'createdat':DateTime.now()
          });
    }
        catch(e){
      print(e);
        }
  }
}