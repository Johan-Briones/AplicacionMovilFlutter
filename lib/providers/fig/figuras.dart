import 'package:flutter/material.dart';

class figuras extends StatelessWidget {
  final Color color;
  final double dimencion;
  final int cantidad;
  const figuras({
    super.key, 
    required this.color,  this.dimencion=40, this.cantidad=0});

  @override
  Widget build(BuildContext context) { 
    return Container(
      width: dimencion,
      height: dimencion,
      color: color,
      child: Center(child: Text("${cantidad==0? "": cantidad}",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
    );
  }
}