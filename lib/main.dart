import 'package:flutter/material.dart';
import 'package:grafica_interfaz/conf/helpers/EncendidoTrigger/utilizacion_api_trigger.dart';
import 'package:grafica_interfaz/presentation/providers/seguridad_providers.dart';
import 'package:grafica_interfaz/presentation/screen/graficas/pantalla_grafica_screen.dart';
import 'package:grafica_interfaz/presentation/screen/power_On_Off/encendido_sistemas.dart';
import 'package:grafica_interfaz/presentation/screen/pruebas/prueba.dart';
import 'package:grafica_interfaz/presentation/screen/WebCam/videoWebCam.dart';
import 'package:grafica_interfaz/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UtilizacionApi Control = UtilizacionApi();
  int selectedIndex = 0;
  bool activo = true;
  @override
  Widget build(BuildContext context) {
    final screens = [
      PantallaGraficaScreen(
        activo: activo,
      ),
      const EncendidoSistemas(),
      const VideoWebCam(),
      const Prueba()
    ];
    return MaterialApp(
        //Rutas de navegacion
        debugShowCheckedModeBanner: false,
        theme: AppTheme(2).theme(),
        title: 'Grafcias',
        home: ChangeNotifierProvider(
            create: (context) => SeguridadProviders(),
            child: Consumer<SeguridadProviders>(builder: (context, datos, _) {
              datos.alert();
              if (!datos.estado.estadoS) {
                datos.DeternerConsultas();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Peligro",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          content: const Text(
                              'HAY UNA PERSONA EN LA ZONA DE VISION',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold)),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                datos.ActivarConsultas();
                                datos.alert();
                                Control.Continuar();
                              },
                              child: const Text('Cerrar'),
                            ),
                          ],
                        );
                      });
                });
              }

              return allOkay(screens);
            })));
  }

  Scaffold allOkay(List<Widget> screens) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(245, 11, 189, 11),
          selectedItemColor: const Color.fromARGB(255, 8, 8, 8),
          unselectedItemColor: const Color.fromARGB(137, 69, 69, 69),
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedFontSize: 32,
          unselectedFontSize: 32,
          elevation: 0,
          //selectedItemColor: Color.fromARGB(255, 0, 0, 0),
          onTap: (value) {
            setState(() {
              selectedIndex = value;
              activo = value == 0;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
                size: 30,
              ),
              label: "Grafica",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.power, size: 30),
              label: "Encender",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam_outlined, size: 30),
              label: "Camara",
            ),
            //BottomNavigationBarItem(icon: Icon(Icons.agriculture_rounded, size: 30),label: "Cumming soon",)
          ]),
    );
  }
}
