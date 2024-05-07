// import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:youthgovt/graph/areagraph.dart';
import 'package:youthgovt/graph/fullcodegraph.dart';
import 'package:youthgovt/graph/piechart.dart';
import 'package:youthgovt/sample.dart';

class mainfilegraph extends StatefulWidget {
  //  final int employeeCount;
  // final int nonEmployeeCount;
  // final int total;
  const mainfilegraph();

  @override
  State<mainfilegraph> createState() => _mainfilegraphState();
}

class _mainfilegraphState extends State<mainfilegraph> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Container(
                      //   height: 200,
                      //   color: Colors.red,
                      // ),
                      Container(
                        height: 750,
                        color: Colors.grey.shade200,
                        child: Stack(
                          children: [
                            
                            Positioned(
                             right: 100,
                              top: 20,
                              child: Container(
                                width: 550,
                                height: 720,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                ),
                                child: Center(
                                  
                                    child:Graph1() ,                                 
                                ),
                              ),
                            ),
                            Positioned(
                              
                              left: 80,
                              top: 20,
                              child: Container(
                                width: 500,
                                height: 850,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade200,
                                ),
                                child: Column(
                                  children: [
                                    Maingraph1(),
                                    SizedBox(height: 10,),
                                  DynamicPieChart1()
                                  ],
                                )
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        
        ],),
      ),
    );
  }
}