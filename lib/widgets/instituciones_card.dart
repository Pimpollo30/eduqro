import 'package:eduqro/models/institucion.dart';
import 'package:eduqro/pages/services/institucion_form_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstitucionCard extends StatelessWidget {
  // const InstitucionCard({super.key});

  final Institucion institucion;

  const InstitucionCard({Key? key, required this.institucion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final institucionService = Provider.of<InstitucionService>(context);
    return Container(
      width: double.infinity,
      child: ListTile(
        leading: ClipRRect(
            child: Image(
              image: AssetImage('assets/no-image.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5)),
        title: Text(
          institucion.nombre,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(institucion.direccion),
            Text("Tel: " + institucion.telefono)
          ],
        ),
      ),
    );
  }
}
