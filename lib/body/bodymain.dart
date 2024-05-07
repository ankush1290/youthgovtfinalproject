import 'package:flutter/material.dart';

class conti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (constraints.maxWidth < 600) {
                // Mobile layout: 1 container per row
                return ListView(
                  children: List.generate(
                    5,
                    (index) => Container(
                      margin: EdgeInsets.all(8.0),
                      color: Colors.blue,
                      height: 280,
                      width: 200,
                      child: Center(child: Text('Container ${index + 1}')),
                    ),
                  ),
                );
              } else {
                // Desktop layout: 4 containers in first row, 1 container in second row
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Row(
                        children: List.generate(
                          4,
                          (index) => Expanded(
                            child: Container(
                              margin: EdgeInsets.all(8.0),
                              color: Colors.blue,
                              height: 280,
                              width: 200,
                              child: Center(child: Text('Container ${index + 1}')),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        color: Colors.blue,
                        height: 280,
                        width: 200,
                        child: Center(child: Text('Container 5')),
                      ),
                    ),
                  ],
                );
              }
            },
      ));
  }
}
