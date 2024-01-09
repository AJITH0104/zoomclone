import 'package:flutter/material.dart';
import 'package:zoomclone/colors.dart';
import 'package:zoomclone/prevmeeting.dart';
import 'package:zoomclone/settings.dart';
import 'package:zoomclone/widgets/homemeetingbutton.dart';

import 'historymeeting.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int Page=0;
  onpgchange(int page){
    setState(() {
      Page=page;
    });
  }
  List <Widget> pages=[
    historymeeting(),
    prevmeeting(),
    Text('contacts'),
    settings(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet and Chat'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onpgchange,
        currentIndex: Page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(icon: Icon((Icons.comment_bank),),label: "Meet and Chat"),

          BottomNavigationBarItem(icon: Icon((Icons.lock_clock),),label: "Meetings",),

          BottomNavigationBarItem(icon: Icon((Icons.person_2_outlined),),label: "Contacts"),

          BottomNavigationBarItem(icon: Icon((Icons.settings),),label: "Settings"),


        ],
      ),
      body: pages[Page],
    );
  }
}


