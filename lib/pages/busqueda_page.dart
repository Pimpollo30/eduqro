// import 'package:eduqro/widgets/navigation_bar.dart';
import 'package:eduqro/pages/suscribirse_page.dart';
import 'package:eduqro/widgets/instituciones_card.dart';
import 'package:flutter/material.dart';

class BusquedaForm extends StatelessWidget {
  // const _BusquedaForm({super.key});
  @override
  Widget build(BuildContext context) {
    return 
    SafeArea(
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: Form(
                    child: Column(
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
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                          ),
                          items: [DropdownMenuItem(child: Text('Nivel'))], 
                          onChanged: (value) {}),
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                              child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                          ),
                          items: [DropdownMenuItem(child: Text('Sector'))], 
                          onChanged: (value) {}),
                            ),
                          ],
                        ),
                        SizedBox(height:10),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                          ),
                          items: [DropdownMenuItem(child: Text('Ciudad'))], 
                          onChanged: (value) {}),
                        SizedBox(height:10),
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                          ),
                          items: [DropdownMenuItem(child: Text('Área o Especialidad'))], 
                          onChanged: (value) {}),              
                      ],
                      )
                    ),
                ),
                SizedBox(height:10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Resultados",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black87,
                  ),),
                ),
                SizedBox(height:10),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) => GestureDetector(
                  child: InstitucionCard(),
                  onTap: () {
                    Navigator.pushNamed(context, "verDetalles");
                  },
                  )),
              ]),
          ),
        );
  }
}

