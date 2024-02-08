import 'package:flutter/material.dart';
import 'package:grafica_interfaz/presentation/providers/datos_providers.dart';
import 'package:provider/provider.dart';
class Notifier extends StatelessWidget {
  const Notifier({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(create: (context) => DatosProviders(),
      child: HomePage(),)
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Acceder al modelo desde el contexto
    DatosProviders dataModel = Provider.of<DatosProviders>(context);
    dataModel.paint();
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi Aplicación'),
      ),
      body: Center(
        child: Text("${dataModel.datos.numeros}"),
      ),
    );
  }
}