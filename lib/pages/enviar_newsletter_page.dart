import 'package:flutter/material.dart';

class EnviarNewsletterPage extends StatefulWidget {
  const EnviarNewsletterPage({super.key});

  @override
  State<EnviarNewsletterPage> createState() => _EnviarNewsletterPageState();
}

enum SingingCharacter { todos, usuarios }

class _EnviarNewsletterPageState extends State<EnviarNewsletterPage> {
  SingingCharacter? _character = SingingCharacter.todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Enviar Newsletter")),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Detalles del Newsletter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fecha",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "XX/XX/XXXX",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height:10,),
                      Text(
                        "Asunto",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "Ea aliqua ut sint magna est do ullamco esse laborum pariatur nostrud nulla irure labore. Aliqua reprehenderit dolor aliquip laboris cillum do ad Lorem eu incididunt dolore labore. Mollit fugiat sunt nisi culpa esse nulla aliquip et aute irure duis.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height:15),
                      Text(
                        "Destinatarios",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                              "Todos los usuarios suscritos al newsletter"),
                          leading: Radio<SingingCharacter>(
                            activeColor: Colors.orange,
                            value: SingingCharacter.todos,
                            groupValue: _character,
                            onChanged: (value) {
                              setState(
                                () {
                                  _character = value;
                                },
                              );
                            },
                          )),
                      ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text("Usuarios de una determinada entidad"),
                          leading: Radio<SingingCharacter>(
                            activeColor: Colors.orange,
                            value: SingingCharacter.usuarios,
                            groupValue: _character,
                            onChanged: (value) {
                              setState(
                                () {
                                  _character = value;
                                },
                              );
                            },
                          )),
                      Form(
                          child: Column(
                        children: [
                          DropdownButtonFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color:Colors.orange)
                                  ),
                              ),
                              items: [DropdownMenuItem(child: Text('Ciudad'))],
                              onChanged: (value) {}),
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
                                  "Enviar",
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
            )));
  }
}
