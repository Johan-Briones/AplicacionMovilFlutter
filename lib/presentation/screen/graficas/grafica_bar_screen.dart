import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:grafica_interfaz/domain/grafica_datos_domain.dart';
import 'package:grafica_interfaz/providers/fig/figuras.dart';

List<Color> colors = [
  Colors.yellow,
  Colors.yellow,
  Colors.yellow,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.green,
  Colors.red,
  Colors.red,
  Colors.red,
];

class GraficaBarScreen extends StatefulWidget {
  final Datos datos;
  const GraficaBarScreen({super.key, required this.datos});

  @override
  _GraficaBarScreenState createState() => _GraficaBarScreenState();
}

class _GraficaBarScreenState extends State<GraficaBarScreen> {
  late int showingTooltip;

  @override
  void initState() {
    showingTooltip = -1;
    super.initState();
  }

  List<BarChartGroupData> _tablaBar(List<dynamic> list, List<Color> colors) {
    List<BarChartGroupData> listGrafica = [];
    for (int i = 0; i < list.length; i++) {
      listGrafica.add(BarChartGroupData(
        x: i,
        showingTooltipIndicators: showingTooltip == i ? [0] : [],
        barRods: [
          BarChartRodData(
              borderRadius: BorderRadius.zero,
              y: list[i].toDouble(),
              colors: [colors[i]],
              width: 25),
        ],
      ));
    }
    return listGrafica;
  }

  BarChartGroupData generateGroupData(int x, int y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: showingTooltip == x ? [0] : [],
      barRods: [
        BarChartRodData(
            borderRadius: BorderRadius.zero,
            y: y.toDouble(),
            colors: [Colors.green],
            width: 14),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        const Text(
          "DATOS GRAFICA BARRAS",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 700,
          height: 350,
          child: BarChart(
            BarChartData(
              barGroups: _tablaBar(widget.datos.numeros, colors),
              barTouchData: BarTouchData(
                  enabled: true,
                  handleBuiltInTouches: false,
                  touchCallback: (event, response) {
                    if (response != null &&
                        response.spot != null &&
                        event is FlTapUpEvent) {
                      setState(() {
                        final x = response.spot!.touchedBarGroup.x;
                        final isShowing = showingTooltip == x;
                        if (isShowing) {
                          showingTooltip = -1;
                        } else {
                          showingTooltip = x;
                        }
                      });
                    }
                  },
                  mouseCursorResolver: (event, response) {
                    return response == null || response.spot == null
                        ? MouseCursor.defer
                        : SystemMouseCursors.click;
                  }),
              titlesData: FlTitlesData(
                topTitles: SideTitles(showTitles: false),
                leftTitles: SideTitles(showTitles: true),
                bottomTitles: SideTitles(showTitles: false),
                rightTitles: SideTitles(showTitles: true),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        for (Widget i in _datosGrafica2(widget.datos.numeros, colors)) i
      ],
    );
  }

  List<Widget> _datosGrafica2(List<dynamic> list, List<Color> col) {
    List<Widget> widgets = [];
    List<Widget> widgets2 = [];
    for (int i = 0; i < list.length; i++) {
      widgets.add(
        figuras(
          color: col[i],
          cantidad: i + 13,
        ),
      );
      widgets.add(SizedBox(
        width: 75,
        child: Row(
          children: [
            Text(
              "${list[i]}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ));

      widgets.add(const SizedBox(
        width: 20,
        height: 50,
      ));
      if ((i + 1) % 5 == 0) {
        widgets.removeLast();
        widgets2.add(Row(
            mainAxisAlignment: MainAxisAlignment.center, children: widgets));
        widgets = [];
      }
    }
    widgets.removeLast();
    widgets2.add(
        Row(mainAxisAlignment: MainAxisAlignment.center, children: widgets));
    return widgets2;
  }

  Row _datosGrafica(List<String> list) {
    List<Widget> widgets = [];
    for (String texto in list) {
      widgets.add(
        const figuras(
          color: Color.fromARGB(255, 240, 208, 2),
        ),
      );
      widgets.add(SizedBox(
        width: 60,
        child: Row(
          children: [
            Text(
              texto,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ));

      widgets.add(const SizedBox(width: 15));
    }
    widgets.removeLast();
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: widgets);
  }
}
