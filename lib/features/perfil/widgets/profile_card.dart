import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  //es sin estado porque mantiene la información y no la vamos a modificar
  final String user;
  final IconData icon;
  final Color iconColor;

  const ProfileCard({
    super.key,
    required this.user,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context){
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 50,
          child: Icon(
            icon,
            size:60,
            color: iconColor,
          ),
        ),
        title: Text(user, style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          )),
        // trailing: Text(
        //   trailingText,
        //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        // ),
      ),
    );
  }
}