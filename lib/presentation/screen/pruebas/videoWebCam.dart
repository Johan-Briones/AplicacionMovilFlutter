import 'package:flutter/material.dart';

class VideoWebCam extends StatefulWidget {
  const VideoWebCam({super.key});

  @override
  State<VideoWebCam> createState() => _VideoWebCamState();
}

class _VideoWebCamState extends State<VideoWebCam> {
  String imageUrl = 'http://localhost:3000/stream';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "En Desarrollo", style: TextStyle(fontSize: 50),
      ),
    );
  }
}