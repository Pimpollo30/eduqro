import 'package:flutter/material.dart';

class EditarOfertaEducativaPage extends StatelessWidget {
  // const EditarOfertaEducativaPage({super.key});
  TextEditingController textarea = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Oferta Educativa")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
                child: Column(
              children: [
                SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black87,
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
                TextFormField(
                  cursorColor: Colors.black87,
                  controller: textarea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    // labelText: 'Propósito del programa educativo',
                    hintText: 'Propósito del programa educativo',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black87,
                  controller: textarea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    // labelText: 'Programa Académico',
                    hintText: 'Programa Académico',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                SizedBox(height: 10),
                MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Text(
                        "Modificar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    color: Colors.orange,
                    onPressed: () {}),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
