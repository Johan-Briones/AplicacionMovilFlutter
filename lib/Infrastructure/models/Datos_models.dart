

import 'dart:convert';

import 'package:grafica_interfaz/domain/grafica_datos_domain.dart';

DatosModel datosModelJson(String str)=>DatosModel.fromJsonMap(json.decode(str));
String datosModelToJson(DatosModel data)=>json.encode(data.toJson());

class DatosModel{
  final List<dynamic> nnumeros;
  final int ncantidadObservada;
  final int ncantidadEnRango;
  final int nporDebajo;
  final int nporEncima;
  final int nprocentaje1;
  final int nprocentaje2;
  final int nprocentaje3;
  DatosModel( 
    {
      
      required this.nnumeros, 
      required this.ncantidadEnRango, 
      required this.ncantidadObservada, 
      required this.nporDebajo, 
      required this.nporEncima,
      required this.nprocentaje1, 
      required this.nprocentaje2, 
      required this.nprocentaje3,
    }
    );

    factory DatosModel.fromJsonMap(Map<String,dynamic> json)=>DatosModel(
      nnumeros: json["numeros"],
      ncantidadObservada: json["cantidadObservada"],
      ncantidadEnRango: json["cantidadEnRango"],
      nporDebajo: json["porDebajo"],
      nporEncima: json["porEncima"],
      nprocentaje1: json["porcentaje1"],
      nprocentaje2: json["porcentaje2"],
      nprocentaje3: json["porcentaje3"]
       );

    Map<String,dynamic>toJson()=>{
      "numeros":nnumeros,
      "cantidadEnRango":ncantidadEnRango,
      "cantidadObservada":ncantidadObservada,
      "porDebajo":nporDebajo,
      "porEncima":nporEncima,
      "porcentaje1":nprocentaje1,
      "porcentaje2":nprocentaje2,
      "porcentaje3":nprocentaje3
    };
    Datos toDatosEntity()=>Datos(
      numeros: nnumeros,
      cantidadEnRango: ncantidadEnRango,
      cantidadObservada: ncantidadObservada,
      porDebajo: nporDebajo,
      porEncima: nporEncima,
      procentaje1: nprocentaje1,
      procentaje2: nprocentaje2,
      procentaje3: nprocentaje3
    );
}