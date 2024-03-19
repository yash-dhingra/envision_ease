import 'package:envision_ease/pages/video_page.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final String featureName;
  final String iconPath;

  const FeatureBox({
    super.key,
    required this.featureName,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VideoPage()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //icon
              Image.asset(
                iconPath,
                height: 65,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        featureName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
