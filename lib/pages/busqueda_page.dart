// import 'package:eduqro/widgets/navigation_bar.dart';
import 'package:eduqro/pages/suscribirse_page.dart';
import 'package:flutter/material.dart';

class BusquedaForm extends StatelessWidget {
  // const _BusquedaForm({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(height:10),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                            hintText: 'Nombre'
                          ),
                        ),
                        SizedBox(height:10),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Nivel Educativo',
                                  hintText: 'Nivel Educativo'
                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Sector',
                                  hintText: 'Sector'
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:10),
                        DropdownButtonFormField(
                          items: [DropdownMenuItem(child: Text('Ciudad'))], 
                          onChanged: (value) {}),
                        SizedBox(height:10),
                        DropdownButtonFormField(
                          items: [DropdownMenuItem(child: Text('Área o Especialidad'))], 
                          onChanged: (value) {}),              
                      ],
                      )
                    ),
                )
              ]),
          ),
        );
  }
}

