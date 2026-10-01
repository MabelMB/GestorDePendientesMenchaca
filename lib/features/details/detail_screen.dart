import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/models/activity.dart';

class DetailScreen extends StatelessWidget{
  final Item activity;
  
  const DetailScreen({
    super.key,
    required this.activity
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(activity.title)),
      body: Center(
        child: Column(
            children: [
              Text('Detalles de la actividad pendiente'),
              ElevatedButton(
                onPressed: () => Navigator.pop(context), 
                child: Text("Volver")),
            ],
        ),
      ),
    );
  }
}