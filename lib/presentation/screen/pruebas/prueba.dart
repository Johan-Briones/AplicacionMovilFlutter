/*import 'package:flutter/material.dart';
import 'package:grafica_interfaz/domain/grafica_datos_domain.dart';
import 'package:grafica_interfaz/presentation/providers/datos_providers.dart';

class Prueba extends StatelessWidget {
   final DatosProviders datosProviders = DatosProviders();

  Prueba({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tu App'),
      ),
      body: FutureBuilder<Datos>(
        future: datosProviders.paint(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Muestra un indicador de carga mientras se obtienen los datos
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
          } else if (!snapshot.hasData) {
            return Text('No hay datos disponibles',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
          } else {
            // Aquí puedes usar los datos obtenidos en snapshot.data
            return Text('Dato: ${snapshot.data?.numeros}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),);
          }
        },
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}