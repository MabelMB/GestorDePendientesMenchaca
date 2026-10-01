import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/models/activity.dart';
import 'package:flutter_application_1/features/home/widgets/interactive_activity_card.dart';
//import 'package:flutter_application_1/features/home/widgets/interactive_activity_card.dart';
//import 'package:flutter_application_1/features/perfil/screens/profile_screen.dart';

//Clase: ¿Qué actividades existen en esta pantalla
//y cuántas debo mostrar? Crea los objetos

//Qué tipo de widget es
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Dónde está su estado. Está heredando de MyHomePage
//porque está representando su estado!!
//stateful >> widget + clase state porque ES CON ESTADO
//El State es donde Flutter mantiene la información que cambia durante la vida del widget
class _MyHomePageState extends State<MyHomePage> {
  //le damos las actividades que tenemos
  List<Item> itemList = [
    Item(
      title: "Harry Potter", 
      category: "Libro", 
      completado: false
      ),
    Item(
      title: "Los juegos del hambre", 
      category: "Libro", 
      completado: false
      ),
    Item(
      title: "Proyecto Hail Mary", 
      category: "Película", 
      completado: false
      ),
  ];

  void _mostrarDialogo(BuildContext context){
    final tituloController = TextEditingController();
    //final categoryController = TextEditingController();
    String? categoriaSeleccionada = 'Libros';

    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Agrega tu nuevo pendiente'),
          content: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: tituloController,
                  decoration: InputDecoration(
                    labelText: 'Título',
                  ),
                ),
                DropdownButton<String>(
                  value: categoriaSeleccionada,
                  items: <String>['Videojuegos', 'Libros', 'Películas'].map((String valor){
                    return DropdownMenuItem<String>(
                      value: valor, 
                      child: Text(valor),
                      );
                  }).toList(),
                  onChanged: (String? nuevoValor){
                    setState(() {
                      categoriaSeleccionada = nuevoValor;
                    });
                  },
                ),
                // TextFormField(
                //   controller: categoryController,
                //   decoration: InputDecoration(
                //     labelText: 'Categoría',
                //   ),
                // ),
              ],
            ),
          ),
          actions: <Widget>[
              TextButton(
                onPressed: (){
                    Navigator.of(context).pop();
                }, 
                child: Text('Cerrar'),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    final nuevoItem = Item(
                    title: tituloController.text, 
                    //category: categoryController.text, 
                    category: categoriaSeleccionada!,
                    completado: false
                    );
                    itemList.add(nuevoItem);
                    Navigator.pop(context);
                  });

                  final snackBar = SnackBar(
                    content: Text('Elemento agregado exitosamente'),
                    duration: Duration(seconds: 3),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }, 
                
                child: Text('Guardar'),
                ),
          ],
        );
      }
    );
  }

  @override
  //Flutter puede volver a llamar build() cuando necesita actualizar la interfaz
  Widget build(BuildContext context) {
    //build() devuelve un widget
    return Scaffold(
    //Scaffold es un Widget y es la estructura básica de una pantalla de Material Design
    //Proporciona appBar y body
      appBar: AppBar(
        //configurando la barra superior de Home
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text("Gestor personal"),
      ),
      body: 
        Padding(
          //aplicar padding a un widget en particular
          padding: EdgeInsets.all(16.0),
          child:Column(
            children: [
              SizedBox(height: 5.0),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: itemList.length,
                  itemBuilder: (context, index){
                    final currentItem= itemList[index];
                    return Dismissible(
                        key: Key(currentItem.title),

                        background: Container(
                          color: Colors.red,
                        ),

                        onDismissed: (direction){
                          setState(() {
                            itemList.remove(currentItem);
                          });
                        final snackBar = SnackBar(
                        content: Text('Elemento eliminado exitosamente'),
                        duration: Duration(seconds: 3),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }, 
                        child: InteractiveActivityCard(item: currentItem),
                    );
                    
                  },
                  ),
              ),
            ],
              
            )
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _mostrarDialogo(context),
            child: Icon(Icons.add),
        ),
      
    );
  }
}

