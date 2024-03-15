import 'package:flutter/material.dart';
import 'package:grafica_interfaz/conf/helpers/EncendidoTrigger/utilizacion_api_trigger.dart';
import 'package:http/http.dart' as http;
class EncendidoSistemas extends StatefulWidget {
  
  const EncendidoSistemas({super.key});
  @override
  State<EncendidoSistemas> createState() => _EncendidoSistemasState();
}

class _EncendidoSistemasState extends State<EncendidoSistemas> {
  UtilizacionApi Control=UtilizacionApi();
  final Map<String,bool>estadoElemento={
    '3':true,
    '4':true,
    '5':true, 
    '6':true,
    '7':true
  };
  void _estadoEncendioApagado(String element) {
    setState(() {
      estadoElemento[element]=!estadoElemento[element]!;
      if (estadoElemento[element]==false) {
        if(element=='6') {
          Control.InicioComputadora();
        }
        Control.Control("on/$element");
      } else {
        if(element=='6') {
          Control.FinComputadora();
        }
        Control.Control("off/$element");
      }
      /*
     if( estadoElemento['3']==true && estadoElemento['4']==false ||estadoElemento['5']==false ||estadoElemento['6']==false||estadoElemento['7']==false){
      estadoElemento['3']=false;
      _controlarLED("on1");
     }
     if( estadoElemento['3']==false && estadoElemento['4']==true &&estadoElemento['5']==true &&estadoElemento['6']==true && estadoElemento['7']==true){
      estadoElemento['3']=true;
      _controlarLED("off1");
     }
     */
    });
  }
  void _controlGeneral(){
    setState(() {
      if (estadoElemento['3']==true){
         Control.Control("LedAll-On");
         Control.InicioComputadora();
        for(int i=3;i<=7;i++){
           estadoElemento['$i']=false;
        }
      }else{
        Control.Control("LedAll-Off");
        Control.FinComputadora();
         for(int i=3;i<=7;i++){
           estadoElemento['$i']=true;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _controlGeneral(),
                  child: Text((estadoElemento["3"])==true? 'Encendido General' : 'Apagar General', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(640, 150),
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                ),
              const SizedBox(width: 20),
              ]
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _estadoEncendioApagado("4"),
                  style: ElevatedButton.styleFrom(
                  //backgroundColor: Color.fromARGB(200, 255, 255, 255),
                     fixedSize: const Size(310, 150),
                   elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                  child: Text(estadoElemento['4']==true? 'Encender Compresor' : 'Apagar Compresor', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: () => _estadoEncendioApagado("7"),
                    style: ElevatedButton.styleFrom(
                    //backgroundColor: Color.fromARGB(200, 255, 255, 255),
                      fixedSize: const Size(310, 150),
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                    child: Text(estadoElemento['7']==true? 'Encender Conveyor' : 'Apagar Conveyor', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 ElevatedButton(
              onPressed: () => _estadoEncendioApagado("5"),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(310, 150),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
              
              child: Text((estadoElemento['5']==true)? 'Encender Generador' : 'Apagar Generador', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () => _estadoEncendioApagado("6"),
              child: Text(estadoElemento['6']==true ? 'Encender Computadora' : 'Apagar Computadora', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(310, 150),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
              
            ),
              ],
            ),
            
           
          ],
        ),
      ),
    );
  }
}