import 'package:eduqro/widgets/oferta_educativa_admin.dart';
import 'package:flutter/material.dart';

class AgregarOfertaEducativaPage extends StatelessWidget {
  // const AgregarOfertaEducativaPage({super.key});
  var estilo = TextStyle(fontWeight: FontWeight.w500, fontSize: 20);
  TextEditingController textarea = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Lista de Oferta Educativa'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                ExpansionTile(
                  title: Text("Lista de oferta educativa",
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                  controlAffinity: ListTileControlAffinity.trailing,
                  children: <Widget>[
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) => GestureDetector(
                              child: OfertaEducativaAdminCard(),
                            )),
                  ],
                ),
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
                            "Agregar",
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
        ));
  }
}
