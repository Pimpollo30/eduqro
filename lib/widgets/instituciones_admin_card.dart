import 'package:flutter/material.dart';

class InstitucionAdminCard extends StatelessWidget {
  const InstitucionAdminCard({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        width: double.infinity,
        child: ListTile(
                leading: ClipRRect(
                  child: Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(5),),
                trailing: Container(
                  decoration: BoxDecoration(
                    color:Colors.grey.shade300,
                    border: Border.all(color:Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)),
                  child: IconButton(icon: Icon(Icons.delete_outline, color: Colors.black87,), onPressed: () {},)),
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