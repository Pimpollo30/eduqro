import 'package:eduqro/models/institucion.dart';
import 'package:eduqro/services/institucion_form_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstitucionCard extends StatelessWidget {
  // const InstitucionCard({super.key});

  final Institucion institucion;

  const InstitucionCard({Key? key, required this.institucion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(institucion.logo);
    final institucionService = Provider.of<InstitucionService>(context);
    return Container(
      width: double.infinity,
      child: ListTile(
        leading: Container(
          width: 64,
          height: 64,
          child: ClipRRect(
              child: institucion.logo == null || institucion.logo == ""
                  ? Image(
                      image: AssetImage('assets/no-image.png'),
                      fit: BoxFit.fill,
                    )
                  : FadeInImage(
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(institucion.logo!),
                      fit: BoxFit.fill,
                    ),
              borderRadius: BorderRadius.circular(5)),
        ),
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
