import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () async {
            FirebaseAuth auth=FirebaseAuth.instance;
            auth.signOut();
          }, child: Text('SIGN OUT'))
        ],
      ),
    );
  }
}
