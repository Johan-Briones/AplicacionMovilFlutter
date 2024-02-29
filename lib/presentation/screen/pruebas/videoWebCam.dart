import 'package:flutter/material.dart';
import "package:flutter_mjpeg/flutter_mjpeg.dart";
class VideoWebCam extends StatefulWidget {
  const VideoWebCam({super.key});

  @override
  State<VideoWebCam> createState() => _VideoWebCamState();
}

class _VideoWebCamState extends State<VideoWebCam> {
  bool isRunning=true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 700, width: 700,
          child: Mjpeg(
            isLive: isRunning,
            stream: "http://192.168.0.159:5000/stream",),),
         const SizedBox(width: 20),
          SizedBox(height: 700, width: 700,
          child: Mjpeg(
            isLive: isRunning,
            stream: "http://192.168.0.159:5000/stream2",),),
          
        ],
      ),
    );
  }
}