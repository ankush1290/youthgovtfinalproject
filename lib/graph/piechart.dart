import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bardata1 {
  final String day;
  final String totalEntries;
  final int fieldLength; // Add field length property

  Bardata1({required this.day, required this.totalEntries, required this.fieldLength});
}

class DynamicPieChart extends StatefulWidget {
  @override
  _DynamicPieChartState createState() => _DynamicPieChartState();
}

class _DynamicPieChartState extends State<DynamicPieChart> {
  int touchedIndex = -1;
  List<Bardata1> bardataList = [];
  double totalFieldLength = 0;

  @override
  void initState() {
    super.initState();
    // Fetch data from Firebase and update the pie chart sections
    fetchDataAndUpdateChart();
  }

 void fetchDataAndUpdateChart() async {
    List<Bardata1> data = await fetchData();
    setState(() {
      bardataList = data;
      // Calculate total field length
      totalFieldLength = bardataList.fold(0, (sum, item) => sum + item.fieldLength);
    });
  }

Future<List<Bardata1>> fetchData() async {
  final firestore = FirebaseFirestore.instance;
  QuerySnapshot querySnapshot = await firestore.collection('skill').get();
  List<Bardata1> bardataList = [];
  querySnapshot.docs.forEach((doc) {
    try {
      String day = doc.id;
      String totalEntries =  doc['user1'].toString();
      int fieldLength = doc.data() != null ? (doc.data() as Map<String, dynamic>).keys.length : 0;

      print('Document ID: $day, Field Length: $fieldLength'); // Print field length
      
      bardataList.add(Bardata1(day: day, totalEntries: totalEntries, fieldLength: fieldLength));
    } catch (e) {
      print('Error parsing document ID or totalEntries: $e');
    }
  });
  return bardataList;
}


List<PieChartSectionData> showingSections() {
    return bardataList.map((data) {
      final int index = bardataList.indexOf(data);
      final isTouched = index == touchedIndex;
      final double fontSize = isTouched ? 16 : 12;
      final double radius = isTouched ? 120 : 100;
      final Color color = _getColorForIndex(index); // Get color based on index
      final double percentage = totalFieldLength != 0 ? (data.fieldLength / totalFieldLength) * 100 : 0; // Calculate percentage

      return PieChartSectionData(
        color: color,
        value: percentage, // Use percentage as the value
        title: "${percentage.toStringAsFixed(2)}%", // Display percentage in title
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  Color _getColorForIndex(int index) {
    List<Color> colors = [Colors.blue, Colors.green, Colors.orange, Colors.red];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: 650,
      decoration: BoxDecoration(
      borderRadius:BorderRadius.circular(10),
      color: Colors.white
    ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    PieChartData(
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {
                          setState(() {
                            if (!event.isInterestedForInteractions ||
                                pieTouchResponse == null ||
                                pieTouchResponse.touchedSection == null) {
                              touchedIndex = -1;
                              return;
                            }
                            touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                          });
                        },
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections(),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: bardataList.map((data) {
                final int index = bardataList.indexOf(data);
                final Color color = _getColorForIndex(index); // Get color based on index
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      touchedIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          color: color,
                        ),
                        SizedBox(width: 8),
                        Text(
                          data.day,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
