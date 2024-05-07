import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';

class RawDataSet {
  final String title;
  final Color color;
  final List<double> values;

  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });
}

class Bardata1 {
  final String category;
  final double map1;
  final double map2;
  final double map3;

  Bardata1({
    required this.category,
    required this.map1,
    required this.map2,
    required this.map3,
  });
}

class Graph1 extends StatefulWidget {
  // final int employeeCount;
  // final int nonEmployeeCount;
  // final int total;
  const Graph1({Key? key, }) : super(key: key);

  @override
  State<Graph1> createState() => _Graph1State();
}

class _Graph1State extends State<Graph1> {
  late Future<List<Bardata1>> futureData;
  int selectedDataSetIndex = -1;
  double angleValue = 0;
  bool relativeAngleMode = true;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<List<Bardata1>> fetchData() async {
    final firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('map').get();
    List<Bardata1> bardataList = [];
    querySnapshot.docs.forEach((doc) {
      try {
        String category = doc.id;
        double map1 = double.parse(doc['map1'].toString());
        double map2 = double.parse(doc['map2'].toString());
        double map3 = double.parse(doc['map3'].toString());
        bardataList.add(Bardata1(
          category: category,
          map1: map1,
          map2: map2,
          map3: map3,
        ));
      } catch (e) {
        print('Error parsing document fields: $e');
      }
    });
    return bardataList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
          children: [
            Container(
              height: 720,
              width: 550,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,

              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedDataSetIndex = -1;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Radar'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Jammu & kashmir'.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<Bardata1>>(
                        future: futureData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else {
                            return Column(
                              children: [
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) {
                                      final bardata = snapshot.data![index];
                                      final isSelected =
                                          index == selectedDataSetIndex;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedDataSetIndex = index;
                                          });
                                        },
                                        child: AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          height: isSelected ? 36 : 26,
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.grey.shade300
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                            horizontal: 6,
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              AnimatedContainer(
                                                duration: const Duration(
                                                    milliseconds: 400),
                                                curve: Curves.easeInToLinear,
                                                padding: EdgeInsets.all(
                                                    isSelected ? 8 : 6),
                                                decoration: BoxDecoration(
                                                  color: _getColorFromCategory(
                                                      bardata.category),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              AnimatedDefaultTextStyle(
                                                duration: const Duration(
                                                    milliseconds: 300),
                                                curve: Curves.easeInToLinear,
                                                style: TextStyle(
                                                  color: isSelected
                                                      ? Colors.black
                                                      : Colors.black,
                                                ),
                                                child: Text(bardata.category),
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  height: 520,
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 520,
                                        width: 340,
                                        color: Colors.white,
                                        child: AspectRatio(
                                          aspectRatio: 1.3,
                                          child: RadarChart(
                                            RadarChartData(
                                              radarTouchData: RadarTouchData(
                                                touchCallback:
                                                    (FlTouchEvent event, response) {
                                                  if (!event
                                                      .isInterestedForInteractions) {
                                                    setState(() {
                                                      selectedDataSetIndex = -1;
                                                    });
                                                    return;
                                                  }
                                                  setState(() {
                                                    selectedDataSetIndex = response
                                                            ?.touchedSpot
                                                            ?.touchedDataSetIndex ??
                                                        -1;
                                                  });
                                                },
                                              ),
                                              dataSets:
                                                  showingDataSets(snapshot.data!),
                                              radarBackgroundColor:
                                                  Colors.transparent,
                                              borderData: FlBorderData(show: false),
                                              radarBorderData: const BorderSide(
                                                  color: Colors.transparent),
                                              titlePositionPercentageOffset: 0.2,
                                              titleTextStyle: const TextStyle(
                                                  color: Colors.black),
                                              getTitle: (index, angle) {
                                                final usedAngle = relativeAngleMode
                                                    ? angle + angleValue
                                                    : angleValue;
                                                if (index == 0) {
                                                  return RadarChartTitle(
                                                    text: 'Employement',
                                                    angle: usedAngle,
                                                  );
                                                } else if (index == 1) {
                                                  return RadarChartTitle(
                                                    text: 'Unemployemnt',
                                                    angle: usedAngle,
                                                  );
                                                } else if (index == 2) {
                                                  return RadarChartTitle(
                                                    text: 'Total',
                                                    angle: usedAngle,
                                                  );
                                                } else {
                                                  return const RadarChartTitle(
                                                      text: '');
                                                }
                                              },
                                              tickCount: 1,
                                              ticksTextStyle: const TextStyle(
                                                  color: Colors.transparent),
                                              tickBorderData: const BorderSide(
                                                  color: Colors.transparent),
                                              gridBorderData: const BorderSide(
                                                  color: Colors.black, width: 2),
                                            ),
                                            swapAnimationDuration:
                                                const Duration(milliseconds: 400),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: 50,
                                          width: 120,
                                          color: Colors.white,
                                          child: ValueDisplayWidget(
                                            bardata: futureData,
                                            selectedIndex: selectedDataSetIndex,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        
      ),
    );
  }

  List<RadarDataSet> showingDataSets(List<Bardata1> data) {
    return rawDataSets(data).asMap().entries.map((entry) {
      final index = entry.key;
      final rawDataSet = entry.value;

      final isSelected = index == selectedDataSetIndex
          ? true
          : selectedDataSetIndex == -1
              ? true
              : false;

      return RadarDataSet(
        fillColor: isSelected
            ? rawDataSet.color.withOpacity(0.2)
            : rawDataSet.color.withOpacity(0.05),
        borderColor:
            isSelected ? rawDataSet.color : rawDataSet.color.withOpacity(0.25),
        entryRadius: isSelected ? 3 : 2,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: isSelected ? 2.3 : 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets(List<Bardata1> data) {
    return data.map((bardata) {
      return RawDataSet(
        title: bardata.category,
        color: _getColorFromCategory(bardata.category),
        values: [
          bardata.map1,
          bardata.map2,
          bardata.map3,
        ],
      );
    }).toList();
  }

  Color _getColorFromCategory(String category) {
    // Define a list of colors
    List<Color> colors = [
      Colors.blue.shade300,
      Colors.green.shade300,
      Colors.orange.shade300,
      Colors.red.shade300,
      Colors.purple.shade300,
      Colors.yellow.shade300,
      Colors.indigo.shade300,
      Colors.deepOrange.shade300,
    ];

    // Calculate the hash code of the category name
    int hashCode = category.hashCode;

    // Use the hash code to select a color from the list
    int index = hashCode % colors.length;

    // Return the color corresponding to the index
    return colors[index];
  }
}

class ValueDisplayWidget extends StatelessWidget {
  final Future<List<Bardata1>> bardata;
  final int selectedIndex;

  const ValueDisplayWidget({
    Key? key,
    required this.bardata,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Bardata1>>(
      future: bardata,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Error message
        } else {
          if (selectedIndex == -1 || selectedIndex >= snapshot.data!.length) {
            // No point selected or invalid index
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Employment: 5678989',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Unemployment: -686868',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Total: -4646326',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ],
            );
          } else {
            final selectedData = snapshot.data![selectedIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Employment: ${selectedData.map1.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Unemployment: ${selectedData.map2.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Total: ${selectedData.map3.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ],
            );
          }
        }
      },
    );
  }
}
