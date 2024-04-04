import 'package:flutter/material.dart';
import "package:flutter_mjpeg/flutter_mjpeg.dart";

class VideoWebCam extends StatefulWidget {
  const VideoWebCam({super.key});

  @override
  State<VideoWebCam> createState() => _VideoWebCamState();
}

class _VideoWebCamState extends State<VideoWebCam> {
  bool isRunning = true;
  List<String> datos = [
    "http://127.0.0.1:8000/stream",
    "http://127.0.0.1:8000/stream2"
  ];
  int pocicion = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Boton_Cambio_Camara(0, "Camara1"),
              _Boton_Cambio_Camara(1, "Camara2"),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            child: Mjpeg(
              isLive: isRunning,
              stream: datos[pocicion],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        minimumSize: Size(424, 50)),
                    onPressed: () {
                      setState(() {
                        pocicion = (pocicion - 1) == -1 ? 1 : 0;
                      });
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
                IconButton(
                    style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        minimumSize: Size(424, 50)),
                    onPressed: () {
                      setState(() {
                        pocicion = (pocicion + 1) == 2 ? 0 : 1;
                      });
                    },
                    icon: const Icon(Icons.arrow_forward_ios)),
              ],
            ),
          ),

          /*SizedBox(height:500, width: 500,
          child: Mjpeg(
            isLive: isRunning,
            stream: "http://127.0.0.1:8000/stream2",),),*/
        ],
      ),
    );
  }

  ElevatedButton _Boton_Cambio_Camara(int i, String nombre) {
    return ElevatedButton.icon(
        onPressed: () {
          setState(() {
            pocicion = i;
          });
        },
        style: ElevatedButton.styleFrom(
          //primary: Colors.grey, // Color de fondo del botón
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          textStyle: const TextStyle(fontSize: 16),
          minimumSize: const Size(180, 60),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
        icon: const Icon(Icons.camera_alt_outlined),
        label: Text(
          nombre,
        ));
  }
}
