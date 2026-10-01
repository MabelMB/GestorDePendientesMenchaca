import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/perfil/widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget{
  // final Activity activity;
  
  const ProfileScreen({
        super.key,
  //   required this.activity
     });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi perfil"),
        ),
      body: Center(
        child: Column(
            children: [
               ProfileCard(
                  user: "Mabel",
                  icon: Icons.person,
                  iconColor: Colors.blue,
                  
                ),

              Divider(),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 170,
                  child: Card(
                    child: ListTile(
                      title: Text("Entrenamientos completados"),
                      subtitle: Text("15"),
                    ),
                  ),
                ),

              SizedBox(
                  width: 170,
                  child: Card(
                    child: ListTile(
                      title: Text("Último registro"),
                      subtitle: Text("Máquina abductora"),
                    ),
                  ),
                ),
              ]
            ),
              
              ElevatedButton(
                onPressed: () => Navigator.pop(context), 
                child: Text("Volver")),
            ],
        ),
      ),
    );
  }
}