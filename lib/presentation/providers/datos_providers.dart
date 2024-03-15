import 'package:flutter/material.dart';
import 'package:grafica_interfaz/conf/helpers/consulta_api_datos.dart';
import 'package:grafica_interfaz/domain/grafica_datos_domain.dart';

class DatosProviders extends ChangeNotifier {
  final getDatosGrafica=ConsultaApi();
  late  Datos datos=Datos(
    numeros: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],
     cantidadObservada: 0, 
     cantidadEnRango: 0, 

     porDebajo: 0, 
     porEncima: 0,
     procentaje1: 1,
     procentaje2: 1,
     procentaje3: 1);
     
  Future<void> paint()async{
    try{
      final data=await getDatosGrafica.getAnwe();
      datos=(Datos( 
                 numeros:data.numeros, 
                 cantidadObservada: data.cantidadObservada, 
                 cantidadEnRango: data.cantidadEnRango, 
                 porDebajo: data.porDebajo, 
                 porEncima: data.porEncima,
                 procentaje1: data.procentaje1,
                 procentaje2: data.procentaje2,
                 procentaje3: data.procentaje3
                 ));
    notifyListeners();
    }catch (error){
      print("no existe conexion con el servidor");
    }
    
  }
  Datos elementos(){
    return datos;
  }
}
