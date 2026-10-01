import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/details/detail_screen.dart';
import 'package:flutter_application_1/features/home/models/activity.dart';

class InteractiveActivityCard extends StatefulWidget {
  final Item item;
  const InteractiveActivityCard({
    super.key,
    required this.item
  });
  
  @override
  State<InteractiveActivityCard> createState() => _InteractiveActivityCardState();
}

class _InteractiveActivityCardState extends State<InteractiveActivityCard>{
  bool isCompleted = false;

  @override
  Widget build(BuildContext context){
    return Card(
      color: isCompleted ? Colors.green.shade100 : Colors.white,
      elevation: 4,
      child: ListTile(
        title: Text(widget.item.title),
        subtitle: Text(widget.item.category),
        //subtitle: Text(isCompleted ? '¡Completado!' : 'Pendiente de completar'),
        onTap: (){
          Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => DetailScreen(activity: widget.item)
            ));
        },
        // trailing: IconButton(
        //   onPressed: (){
        //     setState(() {
        //        isCompleted = !isCompleted;
        //     });
        //   }, 
        //   icon: Icon(
        //     isCompleted ? Icons.check_circle : Icons.radio_button_checked,
        //     color: isCompleted  ? Colors.green : Colors.grey,
        //   )
        //   ),
      ),
    );
  }
}