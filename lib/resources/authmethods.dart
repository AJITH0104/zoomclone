import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoomclone/widgets/utils.dart';

class Authmethods{
  final FirebaseAuth auth=FirebaseAuth.instance;
  final FirebaseFirestore firestore=FirebaseFirestore.instance;
  Stream<User?> get authchanges=>auth.authStateChanges();



  User get user => auth.currentUser!;

  Future<bool> signinwithG(BuildContext context ) async{
    bool res=false;
    try{
      final GoogleSignInAccount? googleuser=await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? gauth=await googleuser?.authentication;
      final creds=GoogleAuthProvider.credential(
        accessToken: gauth?.accessToken,
        idToken: gauth?.idToken,
      );
      UserCredential userCredential=await auth.signInWithCredential(creds);
      User? user=userCredential.user;
      if(user!=null){
        if(userCredential.additionalUserInfo!.isNewUser) {
          await firestore.collection('users').doc(user.uid).set(
              {
                'username': user.displayName,
                'uid': user.uid,
                'profile pic': user.photoURL
              }
          );

        }
        res=true;
        }
    }
       on FirebaseAuthException catch(e){
      res=false;
      showsnackbar(context, e.message!);
        }
        return res;

  }
}