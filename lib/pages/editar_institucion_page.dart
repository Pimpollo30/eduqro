import 'package:flutter/material.dart';

class EditarInstitucionPage extends StatelessWidget {

  const EditarInstitucionPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title:Text("Editar Institución")),
       body: SingleChildScrollView(
         child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  TextFormField(
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      // labelText: 'Nombre',
                      hintText: 'Nombre',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                            items: [
                              DropdownMenuItem(child: Text('Nivel Educativo'))
                            ],
                            onChanged: (value) {}),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                            ),
                            items: [DropdownMenuItem(child: Text('Sector'))],
                            onChanged: (value) {}),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                      items: [DropdownMenuItem(child: Text('Ciudad'))],
                      onChanged: (value) {}),
                  SizedBox(height: 10),
                  Text(
                    'Área o Especialidad',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  _CheckBoxes(),
                  TextFormField(
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      // labelText: 'Nombre',
                      hintText: 'Dirección de la institución',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      // labelText: 'Nombre',
                      hintText: 'Página web',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      // labelText: 'Nombre',
                      hintText: 'Correo electrónico',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.black54,
                          decoration: InputDecoration(
                            // labelText: 'Nombre',
                            hintText: 'Facebook',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: TextFormField(
                        cursorColor: Colors.black54,
                        decoration: InputDecoration(
                          // labelText: 'Nombre',
                          hintText: 'Instagram',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.black54,
                          decoration: InputDecoration(
                            // labelText: 'Nombre',
                            hintText: 'Costo por inscripción',
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                          child: TextFormField(
                        cursorColor: Colors.black54,
                        decoration: InputDecoration(
                          // labelText: 'Nombre',
                          hintText: 'Costo por colegiatura',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      // labelText: 'Nombre',
                      hintText: 'Teléfono',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Text(
                      "Modificar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.5,
                        ),
                      ),
                  ),
                  color: Colors.orange,
                  onPressed: () {}
                  ),
                  SizedBox(width:5),
                Expanded(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Text(
                        "Agregar Oferta Educativa",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.5,
                          ),
                        ),
                    ),
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.pushNamed(context, "agregarOferta");
                    }
                    ),
                ),
                ],
              ),
            )
                ],
              )),
            ],
          ),
           ),
       ),
     );
  }
}


class _CheckBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (_) {},
                  ),
                  Text('Artes'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (_) {},
                  ),
                  Text('Ciencias'),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (_) {},
                  ),
                  Text('Educación'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (_) {},
                  ),
                  Text('Humanidades'),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (_) {},
                  ),
                  Text('Ingenierías'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
