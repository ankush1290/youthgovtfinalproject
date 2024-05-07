import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youthgovt/login/loginadmin.dart';

class AdminLoginmain extends StatefulWidget {
  const AdminLoginmain({super.key});

  @override
  State<AdminLoginmain> createState() => _AdminLoginmainState();
}

class _AdminLoginmainState extends State<AdminLoginmain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Head Login"),
        
      ),
      body: Center(child: ElevatedButton(onPressed: (){
        
                           Navigator.pushNamed(context, '/AdminPanelmain');
      }, child: Text("Login")),),
    );
  
  }
}