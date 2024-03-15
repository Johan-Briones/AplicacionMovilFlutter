import 'package:flutter/material.dart';
import 'package:grafica_interfaz/conf/helpers/api_seguridad.dart';
import 'package:grafica_interfaz/domain/datos_seguridad.dart';

class SeguridadProviders extends ChangeNotifier{
  final GetEstado=ApiSeguridad();
  var banConsulta=true;
  late DatosSeguridad estado= DatosSeguridad(camara1:false, camara2: false); 
  
  Future <void> alert() async{
    try{
      if(banConsulta==true)
      {
       final data=await GetEstado.getStatusSegurity();
       estado=(DatosSeguridad(camara1: data.camara1, camara2: data.camara2,estadoS: data.estadoS));
       notifyListeners();
      }
    }catch(error){
      print("error en la octecion de la informacion");
    }
  }
  void DeternerConsultas(){
      banConsulta=false;
  }
  void ActivarConsultas(){
      banConsulta=true;
  }
}