import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoomclone/resources/jitsimeet.dart';
import 'package:zoomclone/widgets/homemeetingbutton.dart';

class historymeeting extends StatelessWidget {
   historymeeting({
    super.key,
  });
  final JitsiMeetMethod jitsiMeetMethod=JitsiMeetMethod();

  createnewmeeting() async{
    var random=Random();
    String roomname=(random.nextInt(10000000)+10000000).toString();
    jitsiMeetMethod.createMeeting(roomName: roomname, isAudioMuted: true, isVideoMuted: true);
  }
  joinmeeting(BuildContext context){
    Navigator.pushNamed(context, '/videocall');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            homemeetingbutton(()=>createnewmeeting(), Icons.video_call_rounded, 'New Meeting'),

            homemeetingbutton(()=>joinmeeting(context), Icons.add_box_rounded, 'Join Meeting'),

            homemeetingbutton(() { }, Icons.calendar_today, 'Schedule'),

            homemeetingbutton(() { }, Icons.arrow_upward, 'ShareScreen'),

          ],
        ),
        const Expanded(child: Center(child: Text('Create or Join meetings with just a click',style: TextStyle(
            fontWeight: FontWeight.bold,fontSize: 19
        ),),),),
      ],
    );
  }
}