import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserInputPage extends StatefulWidget {
  const UserInputPage({Key? key}) : super(key: key);

  @override
  _UserInputPageState createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  final TextEditingController yearController = TextEditingController();
  final TextEditingController fieldNameController = TextEditingController();
  final TextEditingController dataController = TextEditingController();

  @override
  void dispose() {
    yearController.dispose();
    fieldNameController.dispose();
    dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: yearController,
              decoration: InputDecoration(labelText: 'Year'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: fieldNameController,
              decoration: InputDecoration(labelText: 'Field Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: dataController,
              decoration: InputDecoration(labelText: 'Data'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String year = yearController.text;
                String fieldName = fieldNameController.text;
                String data = dataController.text;

                if (year.isNotEmpty && fieldName.isNotEmpty && data.isNotEmpty) {
                  // Update Firestore document
                  await FirebaseFirestore.instance.collection('year').doc(year).update({
                    fieldName: data,
                  });
                  // Show a snackbar to indicate success
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data added successfully')));
                }
              },
              child: Text('Add Data'),
            ),
          ],
        ),
      ),
    );
  }
}
