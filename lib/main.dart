import 'package:flutter/material.dart';
import 'package:grafica_interfaz/presentation/screen/graficas/pantalla_grafica_screen.dart';
import 'package:grafica_interfaz/presentation/screen/power_On_Off/encendido_sistemas.dart';
import 'package:grafica_interfaz/presentation/screen/pruebas/prueba.dart';
import 'package:grafica_interfaz/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens=[const PantallaGraficaScreen(), const EncendidoSistemas(),const Prueba(),const Prueba()];
    return MaterialApp(
      //Rutas de navegacion
      debugShowCheckedModeBanner: false,
      theme:AppTheme(2).theme(),
      title: 'Grafcias',
      home: Scaffold(
        /*appBar: AppBar(
          
          backgroundColor: const Color.fromARGB(245, 11, 189, 11),
          
          actions: <Widget>[
             
              
              IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
              ],   
         /* leading: Row(
            
            children:[
              
              TextButton(onPressed: () {}, child: const Text('Inicio',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black)),),
              TextButton(onPressed: () {}, child: const Text('Enecendido',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black)),),
              TextButton(onPressed: () {}, child: const Text('Graficas',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black)),),
          ]),*/

        ),*/
        body:  IndexedStack(index:selectedIndex, children:screens,),
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
              selectedIndex=value;
            });
          },
         
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.bar_chart, size: 30,),label: "Grafica",),
                BottomNavigationBarItem(icon: Icon(Icons.power, size: 30),label: "Encender",),
                
                BottomNavigationBarItem(icon: Icon(Icons.agriculture_rounded, size: 30),label: "Cumming soon",)]
              ),
        ),
        
    );
  }
}