import 'package:eduqro/models/institucion.dart';
import 'package:eduqro/services/institucion_form_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstitucionAdminCard extends StatelessWidget {
  // const InstitucionAdminCard({super.key});

  final Institucion institucion;

  const InstitucionAdminCard({Key? key, required this.institucion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      fit: BoxFit.cover,
                    )
                  : FadeInImage(
                      placeholder: AssetImage('assets/jar-loading.gif'),
                      image: NetworkImage(institucion.logo!),
                      fit: BoxFit.scaleDown,
                    ),
              borderRadius: BorderRadius.circular(5)),
        ),
        trailing: Container(
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              icon: Icon(
                Icons.delete_outline,
                color: Colors.black87,
              ),
              onPressed: () {
                institucionService.eliminarInstitucion(institucion);
              },
            )),
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
