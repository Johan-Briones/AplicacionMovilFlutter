import 'package:http/http.dart'as http;
import 'package:grafica_interfaz/conf/helpers/direccionesServidor.dart';
class UtilizacionApi{
   void Control(String accion) async { 
    final uri = Uri.parse('${Dick["python"]}/encendido/$accion');
    await http.get(uri);
  }
  void InicioComputadora() async{
    final uri=Uri.parse("${Dick["python"]}/inicio");
    await http.get(uri);
  }
  void FinComputadora() async{
    final uri=Uri.parse("${Dick["python"]}/fin");
    await http.get(uri);
  }
  void Continuar() async{
    final uri=Uri.parse("${Dick["python"]}/continuar");
    await http.get(uri);
  }
}