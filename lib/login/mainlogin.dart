import 'package:flutter/material.dart';
import 'package:youthgovt/login/loginadmin.dart';
import 'package:youthgovt/login/loginhead.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 String _selectedUserRole='Head';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Fixed container height
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              _showRoleSelectionDialog(context);
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }

  void _showRoleSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select User Role'),
          content: DropdownButton<String>(
            value: _selectedUserRole,
            items: <String>['Head', 'Admin'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
  setState(() {
    _selectedUserRole = newValue!;
  });
  Navigator.pop(context); // Close the dialog
  _handleLogin(); // Perform login action based on selected role
},

          ),
        );
      },
    );
  }

  void _handleLogin() {
    // Perform action based on selected role
    if (_selectedUserRole == 'Head') {
      // Navigate to Head screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HeadPage()),
      );
    } else if (_selectedUserRole == 'Admin') {
      // Navigate to Admin screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminPage()),
      );
    }
  }
}
