import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class EncendidoSistemas extends StatefulWidget {
  const EncendidoSistemas({super.key});
  @override
  State<EncendidoSistemas> createState() => _EncendidoSistemasState();
}

class _EncendidoSistemasState extends State<EncendidoSistemas> {
  final Map<String,bool>estadoElemento={
    
    '1':true,
    '2':true,
    
    '3':true, 
    '4':true,
  };
  void _controlarLED(String accion) async { 
    final uri = Uri.parse('http://127.0.0.1:8000/encendido/$accion');
    await http.get(uri);
    //print('Respuesta del servidor: ${respuesta.body}');
  }


  void _estadoEncendioApagado(String element) {
    setState(() {
      estadoElemento[element]=!estadoElemento[element]!;
      if (estadoElemento[element]==false) {
        _controlarLED("on$element");
      } else {
        _controlarLED("off$element");
      }
     if( estadoElemento['1']==true && estadoElemento['2']==false ||estadoElemento['3']==false ||estadoElemento['4']==false){
      estadoElemento['1']=false;
      _controlarLED("on1");
     }
     if( estadoElemento['1']==false && estadoElemento['2']==true &&estadoElemento['3']==true &&estadoElemento['4']==true){
      estadoElemento['1']=true;
      _controlarLED("off1");
     }
    });
  }
  void _controlGeneral(){
    setState(() {
      if (estadoElemento['1']==true){
         _controlarLED("LedAll-On");
        for(int i=1;i<=4;i++){
          
           estadoElemento['$i']=false;
        }
      }else{
        _controlarLED("LedAll-Off");
         for(int i=1;i<=4;i++){
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
                  child: Text((estadoElemento["1"])==true? 'Encendido General' : 'Apagar General', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(310, 150),
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                ),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: () => _estadoEncendioApagado("2"),
                  style: ElevatedButton.styleFrom(
                  //backgroundColor: Color.fromARGB(200, 255, 255, 255),
                     fixedSize: const Size(310, 150),
                   elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
                  child: Text(estadoElemento['2']==true? 'Encender Compresor' : 'Apagar Compresor', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 ElevatedButton(
              onPressed: () => _estadoEncendioApagado("3"),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(310, 150),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
              
              child: Text((estadoElemento['3']==true)? 'Encender Generador' : 'Apagar Genrador', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () => _estadoEncendioApagado("4"),
              child: Text(estadoElemento['4']==true ? 'Encender Computadora' : 'Apagar Computadora', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
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