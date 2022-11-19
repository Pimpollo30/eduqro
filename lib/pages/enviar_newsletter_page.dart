import 'package:eduqro/pages/services/newsletter_service.dart';
import 'package:eduqro/providers/newsletter_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnviarNewsletterPage extends StatefulWidget {
  const EnviarNewsletterPage({super.key});

  @override
  State<EnviarNewsletterPage> createState() => _EnviarNewsletterPageState();
}

enum SingingCharacter { todos, usuarios }

class _EnviarNewsletterPageState extends State<EnviarNewsletterPage> {
  @override
  Widget build(BuildContext context) {
    final newsletterService = Provider.of<NewsletterService>(context);
    return ChangeNotifierProvider(
      create: (_) =>
          NewsletterFormProvider(newsletterService.newsletterSeleccionado!),
      child: _EnviarNewsletterPageBody(
        newsletterService: newsletterService,
      ),
    );
  }
}

class _EnviarNewsletterPageBody extends StatefulWidget {
  // const _EnviarNewsletterPageBody({super.key});

  const _EnviarNewsletterPageBody({
    Key? key,
    required this.newsletterService,
  }) : super(key: key);

  final NewsletterService newsletterService;

  @override
  State<_EnviarNewsletterPageBody> createState() =>
      __EnviarNewsletterPageBodyState();
}

class __EnviarNewsletterPageBodyState extends State<_EnviarNewsletterPageBody> {
  SingingCharacter? _character = SingingCharacter.todos;
  @override
  Widget build(BuildContext context) {
    String _ciudad = "Ciudad...";
    final newsletterFormProvider = Provider.of<NewsletterFormProvider>(context);
    final newsletter = newsletterFormProvider.newsletter!;
    return Scaffold(
        appBar: AppBar(title: Text("Enviar Newsletter")),
        body: SingleChildScrollView(
          child: Container(
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
                    constraints: BoxConstraints(
                        minWidth: double.infinity, minHeight: 175),
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
                          newsletter.fecha,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Asunto",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          newsletter.asunto,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
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
                      title: Text("Todos los usuarios suscritos al newsletter"),
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
                          value: _ciudad,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                          items: _crearCiudades(),
                          onChanged: (value) {
                            _ciudad = value;
                          }),
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
              )),
        ));
  }
}

List<String> ciudades = [
  'Ciudad...',
  'Amealco de Bonfil',
  'Pinal de Amoles',
  'Arroyo Seco',
  'Cadereyta de Montes',
  'Colón',
  'Corregidora',
  'Ezequiel Montes',
  'Huimilpan',
  'Jalpan de Serra',
  'Landa de Matamoros',
  'El Marqués',
  'Pedro Escobedo',
  'Peñamiller',
  'Querétaro',
  'San Joaquín',
  'San Juan del Río',
  'Tequisquiapan',
  'Tolimán',
];

List<DropdownMenuItem> _crearCiudades() {
  List<DropdownMenuItem> lista = [];
  ciudades.forEach((element) {
    lista.add(DropdownMenuItem(child: Text(element), value: element));
  });
  return lista;
}
