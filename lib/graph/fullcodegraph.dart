import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/widgets.dart';

class Bardata1 {
  final String day;
  final double totalEntries;

  Bardata1({required this.day, required this.totalEntries});
}

class Bargraph1 extends StatefulWidget {
  final List<Bardata1> bardataList;

  const Bargraph1({Key? key, required this.bardataList}) : super(key: key);

  @override
  _Bargraph1State createState() => _Bargraph1State();
}

class _Bargraph1State extends State<Bargraph1> {
  Bardata1? touchedData;
  // int? index=-1;

  @override
  Widget build(BuildContext context) {
    List<OrdinalData> data = widget.bardataList.map((bardata) {
      return OrdinalData(domain: bardata.day, measure: bardata.totalEntries);
    }).toList();

    return GestureDetector(
      onTapUp: (details) {
        setState(() {
          touchedData = null;
        });
      },
      child: DChartBarO(
        groupList: [
          OrdinalGroup(
            id: '1',
            data: data,
            // chartType: ChartType.line
            color: Colors.red
          ),
      
          
      ],
      
   
  
      ),
    
      
    );
  }
}



class Maingraph1 extends StatefulWidget {
  const Maingraph1({Key? key}) : super(key: key);

  @override
  State<Maingraph1> createState() => _Maingraph1State();
}

class _Maingraph1State extends State<Maingraph1> {
  late Future<List<Bardata1>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<List<Bardata1>> fetchData() async {
    final firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('year').get();
    List<Bardata1> bardataList = [];
    querySnapshot.docs.forEach((doc) {
      try {
        String day = doc.id;
        double totalEntries = double.parse(doc['totalEntries']);
        bardataList.add(Bardata1(day: day, totalEntries: totalEntries));
      } catch (e) {
        print('Error parsing document ID or totalEntries: $e');
      }
    });
    return bardataList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 550,
    decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(10),
      color: Colors.white
    ),
      // color: Colors.white,
      child: ListView(
        
          padding: EdgeInsets.all(16),
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: FutureBuilder<List<Bardata1>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Bargraph1(bardataList: snapshot.data!);
                  }
                },
              ),
            ),
          ],
        ),
      
    );
  }
}


