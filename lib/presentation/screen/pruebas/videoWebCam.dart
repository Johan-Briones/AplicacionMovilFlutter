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
          SizedBox(height:1500, width: 1500,
          child: Mjpeg(
            isLive: isRunning,
            stream: "http://127.0.0.1:8000/stream",),),
          SizedBox(width: 10,),
           /*SizedBox(height:500, width: 500,
          child: Mjpeg(
            isLive: isRunning,
            stream: "http://127.0.0.1:8000/stream2",),),*/
          
        ],
      ),
    );
  }
}