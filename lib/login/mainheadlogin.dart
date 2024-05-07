import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youthgovt/login/loginhead.dart';

class HeadLoginmain extends StatefulWidget {
  const HeadLoginmain({super.key});

  @override
  State<HeadLoginmain> createState() => _HeadLoginmainState();
}

class _HeadLoginmainState extends State<HeadLoginmain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Head Login"),
        
      ),
      body: Center(child: ElevatedButton(onPressed: (){
        
                     Navigator.pushNamed(context, '/Headpanelmain');
                       
      }, child: Text("Login")),),
    );
  }
}