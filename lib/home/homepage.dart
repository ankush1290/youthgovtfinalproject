// import 'dart:ffi';

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:youthgovt/appbarimages/imagesrow.dart';
import 'package:youthgovt/body/bodymain.dart';
// import 'package:youthgovt/body/bodymain.dart';
import 'package:youthgovt/coursalslide/cousalslides.dart';
import 'package:youthgovt/login/loginadmin.dart';
import 'package:youthgovt/login/loginhead.dart';
import 'package:youthgovt/login/mainheadlogin.dart';
import 'package:youthgovt/login/mainloginadmin.dart';
// import 'package:youthgovt/partner/partner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedLanguage = 'English';
  String _selectedUserRole = "Head"; // Track the selected language

  void _handleLanguageChange(String? newValue) {
    // Update the selected language
    setState(() {
      selectedLanguage = newValue;
    });
    // Perform any other actions related to language change here
    print('Selected Language: $selectedLanguage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 28,
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Social media icons
                    _buildSocialMediaIcon(Icons.facebook),
                    _buildDivider(),
                    _buildSocialMediaIcon(CupertinoIcons.news),
                    _buildDivider(),
                    _buildSocialMediaIcon(Icons.youtube_searched_for),
                    SizedBox(width: 10),
                    // Language dropdown
                    _buildLanguageDropdown(),
                  ],
                ),
              ),
              Container(
                // color: Colors.red,
                height: 120,
                child: ImageWithTextAndIcons(),
              ),

              SizedBox(
                height: 35,
                child: Container(
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child:
                            Text("Home", style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Search",
                            style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("contact US",
                            style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(4000, 200, 0, 0),
                            items: [
                              PopupMenuItem(
                                value: 1,
                                onTap: () {
                                  
                                 
                                          Navigator.pushNamed(context, '/AdminLogin');
                                  
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.admin_panel_settings_outlined),
                                    SizedBox(width: 10),
                                    Text("Admin Login"),
                                  ],
                                ),
                                // onTap: () {
                                //   _showDialog(context);
                                // },
                              ),
                              PopupMenuItem(
                                value: 2,
                                onTap: () {
                                   Navigator.pushNamed(context, '/HeadLogin');},
                                child: Row(
                                  children: [
                                    Icon(Icons.person),
                                    SizedBox(width: 10),
                                    Text("Head Login"),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                        child: Text("Login",
                            style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 530, child: CarouselSliderExample()),
              // SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 450,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 150,
                        top: 20,
                        child: Container(
                          width: 800,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade200,
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("What's New",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                    "Advertisement for recruitment of one post of Director (Safety) on deputation (Including Short-term contract",
                                  ),
                                  Text(
                                      "Advertisement for recruitment of one post of Director (Safety) on deputation (Including Short-term contract"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 240,
                        top: 20,
                        child: Container(
                          width: 300,
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey.shade200,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align content to center horizontally
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Image.network(
                                'https://labour.gov.in/sites/default/files/ministerofmole_0.png',
                                height: MediaQuery.of(context).size.height *
                                    0.2, // Adjust as needed
                                width: MediaQuery.of(context).size.width *
                                    0.2, // Adjust as needed
                              ),
                              // SizedBox(height: 1), // Adjust as needed
                              Text(
                                "Shri Bhupender Yadav\n(Hon'ble Minister)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.01, // Adjust as needed
                                ),
                              ),
                              SizedBox(height: 20), // Adjust as needed
                              Image.network(
                                'https://labour.gov.in/sites/default/files/rameswarteli_2.jpg',
                                height: MediaQuery.of(context).size.height *
                                    0.2, // Adjust as needed
                                width: MediaQuery.of(context).size.width *
                                    0.2, // Adjust as needed
                              ),
                              // SizedBox(height: 3), // Adjust as needed
                              Text(
                                "Shri Rameswar Teli\n(Hon'ble Minister of State)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.01, // Adjust as needed
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 175),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 150,
                      child: Text(
                        "Key Indicator",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    )),
              ),
              Container(
                  height: 700,
                  color: Colors.white,
                  child: Container(
                      height: 750,
                      width: 1220,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //     gradient: LinearGradient(colors: [
                        //   Colors.teal.shade50,
                        //   Colors.teal.shade100
                        // ])
                      ),
                      child: GridView.extent(
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          padding: const EdgeInsets.all(16),
                          crossAxisSpacing: 60,
                          mainAxisSpacing: 30,
                          maxCrossAxisExtent: 260.0,
                          children: <Widget>[
                            Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.orange.shade200),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          CupertinoIcons.folder_badge_minus,
                                          size: 40,
                                        ),
                                        // SizedBox(height: 15,),
                                        Text(
                                          "1,36,45,049",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                        ),

                                        Text(
                                          "No of application submitted",
                                          style:
                                              TextStyle(color: Colors.black38),
                                        )
                                      ]),
                                )),
                            Container(
                                padding: const EdgeInsets.all(8),
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.teal.shade300),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Icon(
                                          CupertinoIcons.folder_badge_minus,
                                          size: 40,
                                        ),
                                        // SizedBox(height: 15,),
                                        Text(
                                          "1,36,45,049",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02),
                                        ),

                                        Text(
                                            "No of total employement application",
                                            style: TextStyle(
                                                color: Colors.black38)),
                                      ]),
                                )),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        CupertinoIcons.folder_badge_minus,
                                        size: 40,
                                      ),
                                      // SizedBox(height: 15,),
                                      Text(
                                        "1,36,45,049",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02),
                                      ),

                                      Text(
                                          "No of total unemployement application ",
                                          style:
                                              TextStyle(color: Colors.black38)),
                                    ]),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green.shade300),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        CupertinoIcons.folder_badge_minus,
                                        size: 40,
                                      ),
                                      // SizedBox(height: 15,),
                                      Text(
                                        "1,36,45,049",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02),
                                      ),

                                      Text(
                                          "No of total that not Verified registers",
                                          style:
                                              TextStyle(color: Colors.black38)),
                                    ]),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue.shade200),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        CupertinoIcons.folder_badge_minus,
                                        size: 40,
                                      ),
                                      // SizedBox(height: 15,),
                                      Text(
                                        "1,36,45,049",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02),
                                      ),

                                      Text(
                                          "No of applicants successfully registered",
                                          style:
                                              TextStyle(color: Colors.black38)),
                                    ]),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.red.shade200),
                            ),
                            // ors.blue2
                          ]))),

              Center(
                child: Text(
                  "Our Partners",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Center(
                child: Text(
                  "PM Vishwakarama is team effort! With partners like you ,we \n          empower every Indian to achieve their dreams.",
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 30,
              ),

              Container(
                height: 470,
                decoration: BoxDecoration(color: Colors.white
                    // gradient: LinearGradient(
                    //     colors: [Colors.teal.shade100, Colors.teal.shade100])),
                    ),
                child: Center(
                  child: Container(
                    height: 470,
                    width: 900,
                    decoration: BoxDecoration(color: Colors.white
                        //     gradient: LinearGradient(colors: [
                        //   Colors.teal.shade50,
                        //   Colors.teal.shade100
                        // ])
                        ),
                    child: GridView.extent(
                      physics: NeverScrollableScrollPhysics(),
                      primary: false,
                      // padding: const EdgeInsets.all(16),
                      crossAxisSpacing: 60,
                      mainAxisSpacing: 30,
                      maxCrossAxisExtent: 130.0,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/academic-partners/ataccama-resized.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/tech-partners/atlassian.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/tech-partners/dynatrace.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/misteo-logo.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/tech-partners/outsystem.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/academic-partners/qualtrics-resized.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/academic-partners/snowflake-resized.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/tech-partners/ui-path.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/nextway-ourpartners.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/plutora-partners.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/Shekel-partners-page.png?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/tech-partners/talend.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/wct-logo1.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/solidatus.png?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          // height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300)),
                          child: Image.network(
                              "https://www.ust.com/content/dam/ust/images/logos/tech-partners/silk.jpg?auto=webp,smallest&quality=80",
                              fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 30,
              // ),
              Container(
                height: 250,
                color: Colors.grey.shade100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 140,
                        width: 150,
                        color: Colors.grey.shade100,
                        child: Column(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Know Us",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                            TextButton(
                                onPressed: () {}, child: Text("contact us")),
                            TextButton(
                                onPressed: () {},
                                child: Text("schemes guidlines")),
                            TextButton(onPressed: () {}, child: Text("FAQs")),
                          ],
                        )),
                    Container(
                        height: 140,
                        width: 140,
                        color: Colors.grey.shade100,
                        child: Column(
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Policy",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                            TextButton(
                                onPressed: () {}, child: Text("Diclaimers")),
                            TextButton(
                                onPressed: () {}, child: Text("Feedback")),
                          ],
                        )),
                    Container(
                      height: 140,
                      width: 140,
                      color: Colors.grey.shade100,
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "Social",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                          TextButton(onPressed: () {}, child: Text("Facebook")),
                          TextButton(
                              onPressed: () {}, child: Text("Instagram")),
                          TextButton(onPressed: () {}, child: Text("Twitter")),
                        ],
                      ),
                    ),
                  ],
                ),
              )

              // conti(),
            ]),
      ),
    );
  }

  Widget _buildSocialMediaIcon(IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Icon(iconData, color: Colors.white),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: double.infinity,
      color: Colors.white,
    );
  }

  Widget _buildLanguageDropdown() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedLanguage,
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
        style: TextStyle(color: Colors.white),
        onChanged: _handleLanguageChange,
        items: <String>['English', 'Spanish', 'French', 'German']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLanguageDropdown1() {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectedLanguage,
        icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
        style: TextStyle(color: Colors.white),
        onChanged: _handleLanguageChange,
        items: <String>['English', 'Spanish', 'French', 'German']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildImage(String url, {double height = 100, double width = 100}) {
    return Image.network(
      url,
      height: height,
      width: width,
    );
  }

  void _showRoleSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select User Role'),
          content: DropdownButton<String>(
            value: _selectedUserRole,
            items: <String>['Head', 'Admin'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedUserRole = newValue!;
              });
              Navigator.pop(context); // Close the dialog
              _handleLogin(); // Perform login action based on selected role
            },
          ),
        );
      },
    );
  }

  void _handleLogin() {
    // Perform action based on selected role
    if (_selectedUserRole == 'Head') {
      // Navigate to Head screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HeadPage()),
      );
    } else if (_selectedUserRole == 'Admin') {
      // Navigate to Admin screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AdminPage()),
      );
    }
  }

  Widget _buildText() {
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
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
