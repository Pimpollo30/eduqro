import 'package:flutter/material.dart';

class InstitucionCard extends StatelessWidget {
  const InstitucionCard({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        width: double.infinity,
        child: ListTile(
                leading: ClipRRect(
                  child: Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover,),
                  borderRadius: BorderRadius.circular(5)),
                title: Text("Nombre de la institución",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  ),),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dirección de la institución"),
                    Text("Tel: XXXXXXXXXX")],),
        ),
      );
  }
}