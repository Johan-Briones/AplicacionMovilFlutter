import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grafica_interfaz/domain/grafica_datos_domain.dart';
import 'package:grafica_interfaz/providers/fig/figuras.dart';

class GraficaPayScreen extends StatelessWidget {
  final Datos datos;
  const GraficaPayScreen({super.key, required this.datos});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      const Text(
        "DATOS GRAFICA PAY",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 20),
      SizedBox(
        // Establece el ancho deseado
        width: 150,
        height: 450, // Establece la altura deseada
        child: PieChart(
          PieChartData(
            sectionsSpace: 7,
            centerSpaceRadius: 0,
            startDegreeOffset: -90,
            sections: [
              _ElementosGraficaPay(const Color.fromARGB(255, 79, 243, 33),
                  double.parse(datos.procentaje1.toString()), 200),
              _ElementosGraficaPay(const Color.fromARGB(255, 185, 12, 12),
                  double.parse(datos.procentaje2.toString()), 200),
              _ElementosGraficaPay(const Color.fromARGB(255, 240, 208, 2),
                  double.parse(datos.procentaje3.toString()), 200),
            ],
          ),
        ),
      ),
      const SizedBox(height: 20),
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Tiernos",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          figuras(color: Color.fromARGB(255, 240, 208, 2)),
          SizedBox(width: 20),
          Text(
            "Pasados",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          figuras(color: Color.fromARGB(255, 185, 12, 12)),
          SizedBox(width: 20),
          Text(
            "Buenos",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          figuras(color: Color.fromARGB(255, 79, 243, 33)),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${datos.porDebajo}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 80),
          Text(
            "${datos.porEncima}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 80),
          Text(
            "${datos.cantidadEnRango}",
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ]);
  }

  PieChartSectionData _ElementosGraficaPay(
      Color color, double val, double radio) {
    return PieChartSectionData(
      color: color,
      value: val,
      title: '$val%',
      radius: radio,
      titleStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0)),
    );
  }
}
