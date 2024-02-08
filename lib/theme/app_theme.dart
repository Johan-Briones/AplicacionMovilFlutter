import 'package:flutter/material.dart';



const List<Color> _colortheme=[
  Colors.blue,
  Colors.black,
  Colors.white,
  Colors.orange,
  Colors.green,
  Colors.red
];

class AppTheme {
  final int selectedColor;
  AppTheme([this.selectedColor=0]):assert(selectedColor>=0 && selectedColor<=_colortheme.length-1,"Colors must be between 0 and ${_colortheme.length}");
  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colortheme[selectedColor],
      
    );
  }
}