// import 'dart:html';
// import 'dart:js';

import 'package:flutter/material.dart';

class ImageWithTextAndIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: 100,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                child: Image.network(
                  'https://labour.gov.in/sites/all/modules/cmf/cmf_content/assets/images/emblem-dark.png',
                  height: MediaQuery.of(context).size.height * 0.2,
                  // width: MediaQuery.of(context).size.width * 0.2,
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:5,left: 10,bottom: 5),
                      child: SizedBox(
                        child: Text(
                          "GOVERNMENT OF INDIA\n MINISTRY OF \nLABOUR & EMPLOYMENT",
                          maxLines: 3,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth *0.01),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                child: Image.network(
                  'https://labour.gov.in/sites/default/files/g20_2.png',
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              Container(
                child: Image.network(
                  'https://labour.gov.in/sites/default/files/azadi_0.jpg',
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              Container(
                child: Image.network(
                  'https://labour.gov.in/sites/all/themes/labour/images/swach-bharat.png',
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildImage(String url, { double Width = MediaQuery.of(context).size.width,double height = MediaQuery.of(context).size.height;}) {
  //   return Image.network(
  //     url,
  //     height: height,
  //     width: width,
  //   );
  // }

  Widget _buildText(fontsize) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Text(
              "GOVERNMENT OF INDIA\n MINISTRY OF \nLABOUR & EMPLOYMENT",
              maxLines: 3,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: fontsize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
