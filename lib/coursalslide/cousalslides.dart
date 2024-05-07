import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: CarouselSlider(
          items: [
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey, width: 1),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://labour.gov.in/sites/default/files/secretaries.jpg"),
                  fit: BoxFit.cover,
                  scale: 6,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey, width: 1),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://labour.gov.in/sites/default/files/11_6.jpg"),
                  fit: BoxFit.cover,
                  scale: 6,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey, width: 1),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://labour.gov.in/sites/default/files/3_g20_webbanner-01_2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.red,
                border: Border.all(color: Colors.grey, width: 1),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://labour.gov.in/sites/default/files/g20_webbanner.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
          options: CarouselOptions(
            height: 500.0,
            enlargeCenterPage: false,
            pageSnapping: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 700),
            viewportFraction: 0.8,
          ),
        ),
      ),
    );
  }
}

