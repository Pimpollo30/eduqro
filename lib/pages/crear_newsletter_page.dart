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
            body:SingleChildScrollView(
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: TextField(
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Asunto o tema',
                      hintText: 'Texto prueba'
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: SizedBox(
                    child: TextField(
                      controller: textarea,
                      keyboardType: TextInputType.multiline,
                      maxLines: 15,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.redAccent),
                        ),
                        hintText: 'Contenido del boletín',
                        //hintText: 'Texto prueba - te amamos patrón'
                      ),
                    ),
                  ),
                ),
                Center(child: FloatingActionButton.extended(heroTag:"ok",onPressed: (){}, label: Text('Crear Newsletter'))),
              ],
                      ),
            ),
          );
  }
}