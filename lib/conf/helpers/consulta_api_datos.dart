/*import 'package:dio/dio.dart';
import 'package:grafica_interfaz/Infrastructure/models/Datos_models.dart';
import 'package:grafica_interfaz/domain/grafica_datos_domain.dart';

class ConsultaApi {
  final _dio=Dio();
  Future<Datos>getAnwe()async{
    final response =await _dio.get('http://192.168.0.159:5000/api/grafica/1');
    final datosModel=DatosModel.fromJsonMap(response.data);
    return datosModel.toDatosEntity();
  }
  
}*/
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:grafica_interfaz/Infrastructure/models/Datos_models.dart';
import 'package:grafica_interfaz/domain/grafica_datos_domain.dart';

class ConsultaApi {
  final _dio = Dio();

  ConsultaApi() {
    // Desactivar la verificación del certificado SSL
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<Datos> getAnwe() async {
    try {
      final response =
          await _dio.get('https://localhost:5000/api/AplicasionMovil/1');
          //await _dio.get('http://10.42.0.41:5000/api/P/1');
          print(response);
      final datosModel = DatosModel.fromJsonMap(response.data[0]);
      return datosModel.toDatosEntity();
    } catch (e) {
      // Manejar errores, imprimir o retornar un objeto Datos con un estado de error, según tus necesidades.
      print('Error en la solicitud: $e');
      throw e; // O manejar el error de alguna otra manera según tus necesidades.
    }
  }
}

