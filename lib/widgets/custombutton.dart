import 'package:flutter/material.dart';

import '../colors.dart';

class custombutton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const custombutton( this.text,this.onpressed);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(onPressed: onpressed, child: Text(text,style: TextStyle(fontSize: 17,color: Colors.black),),style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,minimumSize: const Size(double.infinity, 50),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: buttonColor)
      
      ),
      ),),
    );
  }
}
