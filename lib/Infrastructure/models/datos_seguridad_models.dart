import 'package:grafica_interfaz/domain/datos_seguridad.dart';

class Procesamiento{
  final bool camara1;
  final bool camara2;
  final bool estadoS;
  Procesamiento({required this.camara1, required this.camara2, this.estadoS=true});
  factory Procesamiento.fromJsonMap(Map<String,dynamic>json)=>Procesamiento(
    camara1: json["SeguridadCamara1"],
    camara2: json["SeguridadCamara2"],
    estadoS: (json["SeguridadCamara1"]==true && json["SeguridadCamara2"]==true)? true:false
    
  );
  Map<String,dynamic>toJson()=>{
    "SeguridadCamara1":camara1,
    "SeguridadCamara2":camara2,
    "Estado":(camara1==true && camara2==true)? true:false
  };
  DatosSeguridad toDatosEntity()=> DatosSeguridad(
    camara1: camara1,
    camara2: camara2,
    estadoS: estadoS
  );
}