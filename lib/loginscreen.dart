import 'package:flutter/material.dart';
import 'package:zoomclone/resources/authmethods.dart';
import 'package:zoomclone/widgets/custombutton.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final Authmethods _authmethods=Authmethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Start or join an meeting",style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Image.asset('images/onboarding.jpg'),
          ),
          custombutton('Login',() async {
            bool res=await _authmethods.signinwithG(context);
            if(res)
              {
                Navigator.pushNamed(context, '/homescreen');
              }

          }),
        ],
      ),
    );
  }
}
