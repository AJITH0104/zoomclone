import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoomclone/homescreen.dart';
import 'package:zoomclone/resources/authmethods.dart';
import 'package:zoomclone/settings.dart';
import 'package:zoomclone/videocall.dart';

import 'colors.dart';
import 'loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom clone',
      theme: ThemeData.dark(

      ).copyWith(useMaterial3: true,scaffoldBackgroundColor: backgroundColor,),
      routes: {
        '/login' :(context)=>const Loginscreen(),
        '/homescreen':(context)=>const homescreen(),
        '/videocall':(context)=>const videocall(),
        '/settings':(context)=>const settings(),
      },
      home: StreamBuilder(
        stream: Authmethods().authchanges,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
          if(snapshot.hasData)
            return homescreen();
          return Loginscreen();
        },
      ) ,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
