import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'User Manual',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            '1. Record a video of you exercising',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            '2. Crop the video to contain only exercise motion',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            '3. Upload the cropped video to the app',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            '4. Wait for your exercise report',
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
