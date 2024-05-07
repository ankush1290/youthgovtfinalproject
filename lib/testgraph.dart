import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class JammuKashmirApp extends StatefulWidget {
  @override
  _JammuKashmirAppState createState() => _JammuKashmirAppState();
}

class _JammuKashmirAppState extends State<JammuKashmirApp> {
  String selectedDistrict = 'Jammu'; // Initial selected district
  String selectedEmployeeStatus = 'Employee'; // Initial selected employee status
  int employeeCount = 0;
  int nonEmployeeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jammu & Kashmir'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton<String>(
            value: selectedDistrict,
            onChanged: (String? newValue) {
              setState(() {
                selectedDistrict = newValue!;
              });
            },
            items: <String>[
              'Jammu',
              'Samba',
              'Kathua',
              'Poonch',
              'Reasi',
              'Udhampur',
              'Doda'
            ].map(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
          SizedBox(height: 20),
          DropdownButton<String>(
            value: selectedEmployeeStatus,
            onChanged: (String? newValue) {
              setState(() {
                selectedEmployeeStatus = newValue!;
              });
            },
            items: <String>['Employee', 'Non-Employee'].map(
              (String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: applyCounts,
            child: Text('Apply'),
          ),
          SizedBox(height: 20),
          Text('Employee Count: $employeeCount'),
          Text('Non-Employee Count: $nonEmployeeCount'),
          StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection('map').doc(selectedDistrict).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              var data = snapshot.data!.data() as Map<String, dynamic>?; // Explicit cast
              if (data == null) {
                return Text('Total Count: 0');
              }
              int total = data['map3'] ?? 0;
              return Text('Total Count: $total');
            },
          ),
        ],
      ),
    );
  }

  void applyCounts() {
    setState(() {
      // Increment the counts for the selected district based on the selected employee status
      if (selectedEmployeeStatus == 'Employee') {
        employeeCount++;
      } else {
        nonEmployeeCount++;
      }

      // Calculate the total count
      int total = employeeCount + nonEmployeeCount;

      // Update Firestore with the new counts
      FirebaseFirestore.instance.collection('map').doc(selectedDistrict).set({
        'map1':  employeeCount,
        'map2': nonEmployeeCount,
        'map3': total, // Store the total count
      });
    });
  }
}
