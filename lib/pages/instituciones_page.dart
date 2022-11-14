import 'package:eduqro/models/institucion.dart';
import 'package:eduqro/pages/services/institucion_form_service.dart';
import 'package:eduqro/widgets/instituciones_admin_card.dart';
import 'package:eduqro/widgets/instituciones_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InstitucionesPage extends StatelessWidget {
  const InstitucionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final institucionService = Provider.of<InstitucionService>(context);    
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height:10),
                TextFormField(
                  cursorColor: Colors.black54,
                  decoration: InputDecoration(
                    // labelText: 'Nombre',
                    hintText: 'Nombre',
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  ),                
                ),  
                SizedBox(height:10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Lista de instituciones",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black87,
                    ),),
                  ),
                  SizedBox(height:10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => GestureDetector(
                    child: InstitucionAdminCard(),
                    onTap: () {
                       Navigator.pushNamed(context, "editarInst");
                    },
                    )),                       
              ],
              )
            ),
            Positioned(
              right:10,
              bottom: 10,
              child: FloatingActionButton(backgroundColor: Colors.orange, heroTag:"agregarInst",child:Icon(Icons.add),onPressed: () {
                institucionService.institucionSeleccionado = new Institucion(
                  nombre:'',
                  nivel: 'Nivel...',
                  sector: 'Sector...',
                  ciudad: 'Ciudad...',
                  direccion: '',
                  telefono: '',
                );                
                Navigator.pushNamed(context, "agregarInst");
              },),
            ),
          ],
        ),
      ),
    );
  }
}