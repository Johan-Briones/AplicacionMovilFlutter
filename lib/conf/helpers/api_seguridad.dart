import 'package:dio/dio.dart';
import 'package:grafica_interfaz/Infrastructure/models/datos_seguridad_models.dart';
import 'package:grafica_interfaz/conf/helpers/direccionesServidor.dart';
import 'package:grafica_interfaz/domain/datos_seguridad.dart';
class ApiSeguridad{
  final _dio=Dio();
  final String url="${Dick["python"]}/seguridad";
  Future<DatosSeguridad> getStatusSegurity() async{
    try{
       final response=await _dio.get(url);
       print(response);
       final datosEstado=Procesamiento.fromJsonMap(response.data);
       return datosEstado.toDatosEntity();
    }catch (e) {
      // Manejar errores, imprimir o retornar un objeto Datos con un estado de error, según tus necesidades.
      print('Error en la solicitud: $e');
      throw e; // O manejar el error de alguna otra manera según tus necesidades.
    }
  } 
}
