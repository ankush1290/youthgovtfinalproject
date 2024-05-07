import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Bardata1 {
  final String day;
  final String totalEntries;
  final int fieldLength; // Add field length property
  final String subDocumentId;

  Bardata1({required this.day, required this.totalEntries, required this.fieldLength, required this.subDocumentId});
}

class DynamicPieChart1 extends StatefulWidget {
  @override
  _DynamicPieChart1State createState() => _DynamicPieChart1State();
}

class _DynamicPieChart1State extends State<DynamicPieChart1> {
  int touchedIndex = -1;
  List<Bardata1> bardataList = [];
  double totalFieldLength = 0;
  String? selectedDocumentId;

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
      // Set the initial value of the dropdown to the first item in bardataList
      if (bardataList.isNotEmpty) {
        selectedDocumentId = bardataList[0].day;
        updatePieChart(); // Update pie chart when data is fetched
      }
    });
  }

  Future<List<Bardata1>> fetchData() async {
    final firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('jobskill').get();
    List<Bardata1> bardataList = [];

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      String day = doc.id;

      QuerySnapshot subCollectionSnapshot = await doc.reference.collection('map').get();

      subCollectionSnapshot.docs.forEach((subDoc) {
        try {
          String subDocumentId = subDoc.id;
          String totalEntries =  subDoc['user2'].toString();
          int fieldLength = subDoc.data() != null ? (subDoc.data() as Map<String, dynamic>).keys.length : 0;

          bardataList.add(Bardata1(subDocumentId:subDocumentId,day: day, totalEntries: totalEntries, fieldLength: fieldLength));
        } catch (e) {
          print('Error parsing sub document ID or totalEntries: $e');
        }
      });
    }

    return bardataList;
  }

  List<PieChartSectionData> showingSections() {
    List<Bardata1> filteredList = bardataList.where((data) => data.day == selectedDocumentId).toList();

    totalFieldLength = filteredList.fold(0, (sum, item) => sum + item.fieldLength);

    return filteredList.map((data) {
      final int index = filteredList.indexOf(data);
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

  void updatePieChart() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return 
       Container(
        height: 360,
        width: 850, // Adjusted width to accommodate both widgets side by side
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
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
            SizedBox(width: 16), // Add space between the pie chart and items
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 25,
                        // width: 80,
                        decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: DropdownButtonFormField<String>(
                          // elevation: 5,/
                          decoration: const InputDecoration.collapsed(hintText: ""),
                          borderRadius: BorderRadius.circular(10),
                          value: selectedDocumentId,
                          onChanged: (newValue) {
                            setState(() {
                              selectedDocumentId = newValue;
                              updatePieChart(); // Call updatePieChart when dropdown value changes
                            });
                          },
                          items: bardataList.map((data) {
                            return data.day;
                          }).toSet().map((day) {
                            return DropdownMenuItem<String>(
                              
                              value: day,
                              child: Text(day),
                            );
                          }).toList(),
                          hint: Text('Districts'),
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Add space between the dropdown and items
                    ...bardataList.where((data) => data.day == selectedDocumentId).map((data) {
                      final int index = bardataList.indexOf(data);
                      final Color color = _getColorForIndex(index); // Get color based on index
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            touchedIndex = index;
                            
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Row(
                            children: [
                              AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                width: touchedIndex == index ? 30 : 20,
                                height: touchedIndex == index ? 30 : 20,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                data.subDocumentId,
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
    
    );
  }
}
