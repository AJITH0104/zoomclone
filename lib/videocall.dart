import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:zoomclone/resources/authmethods.dart';
import 'package:zoomclone/resources/jitsimeet.dart';
import 'package:zoomclone/widgets/meetingopt.dart';

import 'colors.dart';

class videocall extends StatefulWidget {
  const videocall({super.key});

  @override
  State<videocall> createState() => _videocallState();
}

class _videocallState extends State<videocall> {
  late TextEditingController meetingidcontroller;
  late TextEditingController namecontroller;
  final JitsiMeetMethod jitsiMeetMethod=JitsiMeetMethod();
final Authmethods authmethods=Authmethods();
bool isaudiomuted=true;
bool isvideomuted=true;
  @override
  void initState() {
    meetingidcontroller=TextEditingController();
    namecontroller=TextEditingController(text: authmethods.user.displayName);
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
    meetingidcontroller.dispose();
    namecontroller.dispose();
  }
  joinmeeting(){
      jitsiMeetMethod.createMeeting(roomName: meetingidcontroller.text, isAudioMuted: isaudiomuted, isVideoMuted: isvideomuted,username: namecontroller.text);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text('Join a meeting',style: TextStyle(fontSize: 18),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingidcontroller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "ROOM ID",
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: namecontroller,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "NAME",
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
              ),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
            onTap: joinmeeting,
            child: const Padding(padding: EdgeInsets.all(8),
              child: Text('Join',style: TextStyle(
                fontSize: 16,
              ),),
            ),
          ),
          const SizedBox(height: 20,),
          meetingopt( text: 'Don\'t join',ismute:isaudiomuted ,onchange: onaudiomuted,),

          meetingopt( text: 'Don\'t join',ismute:isvideomuted ,onchange: onvideomuted,),
        ],
      ),
    );
  }
  onaudiomuted(bool? val){
    setState(() {
      isaudiomuted=val!;
    });
  }
  onvideomuted(bool? val){
    setState(() {
      isvideomuted=val!;
    });
  }
}
