import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grafica_interfaz/presentation/providers/datos_providers.dart';
import 'package:grafica_interfaz/presentation/screen/graficas/grafica_bar_screen.dart';
import 'package:grafica_interfaz/presentation/screen/graficas/grafica_pay_screen.dart';
import 'package:provider/provider.dart';

class PantallaGraficaScreen extends StatelessWidget {
  
  const PantallaGraficaScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    return ChangeNotifierProvider
    (
      create: (context) => DatosProviders(),
      child: OrientationBuilder(
        builder: (context,orientation){
          DatosProviders dataModel = Provider.of<DatosProviders>(context);
          //Timer.periodic(Duration(seconds: 7), (timer) { 
              dataModel.paint();
          //});
          
          return orientation==Orientation.portrait
            ? SingleChildScrollView(
              child: Column (
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 30,),
                  GraficaPayScreen(datos:dataModel.elementos()),
                  GraficaBarScreen(datos:dataModel.elementos()),
                ],
              ),
            )
            : SingleChildScrollView(
              child: Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 GraficaPayScreen(datos:dataModel.elementos()),
                 const SizedBox(width: 50,),
                 GraficaBarScreen(datos:dataModel.elementos()),
                ],
              ),
            );
        },
      ),
    );
  }

  
}
