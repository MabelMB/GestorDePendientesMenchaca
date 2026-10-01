
//import 'package:flutter/material.dart';
//Clase: ¿Qué ES una actividad?

// Creen una clase llamada Item que contenga al menos 
//tres propiedades: titulo (String), categoria (String) y completado (bool).

class Item {
  final String title;
  final String category;
  final bool completado;

  Item({
    required this.title,
    required this.category,
    required this.completado,
  });
}