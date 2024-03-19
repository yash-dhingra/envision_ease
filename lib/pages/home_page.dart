// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:envision_ease/util/feature_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of features
  List featuresSunglasses = [
    ["Video", "lib/icons/video.png", true],
    ["GPS", "lib/icons/gps.png", false],
    ["Medicine", "lib/icons/medicine.png", false],
    ["Video2", "lib/icons/video.png", false],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  //account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Welcome ",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text("Dashboard"),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: 4,
                padding: const EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return FeatureBox(
                    featureName: featuresSunglasses[index][0],
                    iconPath: featuresSunglasses[index][1],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
