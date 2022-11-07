import 'package:flutter/material.dart';

class CrearNewsletterPage extends StatelessWidget {
  // const CrearNewsletterPage({super.key});
  TextEditingController textarea = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Crear Newsletter'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      // labelText: 'Asunto o tema',
                      hintText: 'Asunto o tema'),
                ),
                SizedBox(height: 10),
                TextFormField(
                  cursorColor: Colors.black87,
                  controller: textarea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 15,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Contenido del boletín',
                    //hintText: 'Texto prueba - te amamos patrón'
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "Crear Newsletter",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      color: Colors.orange,
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
