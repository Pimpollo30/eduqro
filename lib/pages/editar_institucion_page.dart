import 'package:eduqro/models/oferta.dart';
import 'package:eduqro/services/institucion_form_service.dart';
import 'package:eduqro/services/oferta_form_service.dart';
import 'package:eduqro/providers/institucion_form_provider.dart';
import 'package:eduqro/providers/oferta_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class EditarInstitucionPage extends StatelessWidget {
  // const EditarInstitucionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final institucionService = Provider.of<InstitucionService>(context);

    return ChangeNotifierProvider(
      create: (_) =>
          InstitucionFormProvider(institucionService.institucionSeleccionado!),
      child: _EditarInstitucionPageBody(
        institucionService: institucionService,
      ),
    );
  }
}

class _EditarInstitucionPageBody extends StatelessWidget {
  // const _EditarInstitucionPageBody({super.key});

  const _EditarInstitucionPageBody({
    Key? key,
    required this.institucionService,
  }) : super(key: key);

  final InstitucionService institucionService;

  @override
  Widget build(BuildContext context) {
    final institucionFormProvider =
        Provider.of<InstitucionFormProvider>(context);
    final institucion = institucionFormProvider.institucion!;

    final ofertaService = Provider.of<OfertaService>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Editar Institución")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                  key: institucionFormProvider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue: institucion.nombre,
                        cursorColor: Colors.black54,
                        decoration: InputDecoration(
                          // labelText: 'Nombre',
                          hintText: 'Nombre',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        onChanged: (value) => institucion.nombre = value,
                        validator: (value) {
                          if (value == null || value.length < 1) {
                            return 'El nombre es obligatorio';
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField(
                              value: institucion.nivel,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                              items: _crearNiveles(),
                              onChanged: (value) => institucion.nivel = value,
                              validator: (value) {
                                if (value == "Nivel...") {
                                  return 'El nivel es obligatorio';
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: DropdownButtonFormField(
                              value: institucion.sector,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                              items: _creatSectores(),
                              onChanged: (value) => institucion.sector = value,
                              validator: (value) {
                                if (value == "Sector...") {
                                  return 'El sector es obligatorio';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      DropdownButtonFormField(
                        value: institucion.ciudad,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        items: _crearCiudades(),
                        onChanged: (value) => institucion.ciudad = value,
                        validator: (value) {
                          if (value == "Ciudad...") {
                            return 'La ciudad es obligatoria';
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      // Text(
                      //   'Área o Especialidad',
                      //   style: TextStyle(
                      //     fontSize: 16,
                      //     color: Colors.black87,
                      //   ),
                      // ),
                      // _CheckBoxes(),
                      TextFormField(
                        initialValue: institucion.direccion,
                        cursorColor: Colors.black54,
                        decoration: InputDecoration(
                          // labelText: 'Nombre',
                          hintText: 'Dirección de la institución',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        onChanged: (value) => institucion.direccion = value,
                        validator: (value) {
                          if (value == null || value.length < 1) {
                            return 'La dirección es obligatoria';
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autocorrect: false,
                        initialValue: institucion.pagina,
                        cursorColor: Colors.black54,
                        decoration: InputDecoration(
                          // labelText: 'Nombre',
                          hintText: 'Página web',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        onChanged: (value) => institucion.pagina = value,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        autocorrect: false,
                        initialValue: institucion.correo,
                        cursorColor: Colors.black54,
                        decoration: InputDecoration(
                          // labelText: 'Nombre',
                          hintText: 'Correo electrónico',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        onChanged: (value) => institucion.correo = value,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              autocorrect: false,
                              initialValue: institucion.facebook,
                              cursorColor: Colors.black54,
                              decoration: InputDecoration(
                                // labelText: 'Nombre',
                                hintText: 'Facebook',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                              onChanged: (value) =>
                                  institucion.facebook = value,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: TextFormField(
                            autocorrect: false,
                            initialValue: institucion.instagram,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                              // labelText: 'Nombre',
                              hintText: 'Instagram',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            onChanged: (value) => institucion.instagram = value,
                          )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^(\d+)?\.?\d{0,2}'))
                              ],
                              initialValue: institucion.cInscripcion,
                              cursorColor: Colors.black54,
                              decoration: InputDecoration(
                                // labelText: 'Nombre',
                                hintText: 'Costo por inscripción',
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.orange)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                              ),
                              onChanged: (value) =>
                                  institucion.cInscripcion = value,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: TextFormField(
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'^(\d+)?\.?\d{0,2}'))
                            ],
                            initialValue: institucion.cColegiatura,
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                              // labelText: 'Nombre',
                              hintText: 'Costo por colegiatura',
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                            ),
                            onChanged: (value) =>
                                institucion.cColegiatura = value,
                          )),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue: institucion.telefono,
                        cursorColor: Colors.black54,
                        decoration: InputDecoration(
                          // labelText: 'Nombre',
                          hintText: 'Teléfono',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        onChanged: (value) => institucion.telefono = value,
                        validator: (value) {
                          if (value == null || value.length < 1) {
                            return 'El teléfono es obligatorio';
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        initialValue: institucion.logo,
                        cursorColor: Colors.black54,
                        decoration: InputDecoration(
                          // labelText: 'Nombre',
                          hintText: 'Logo URL',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                        onChanged: (value) => institucion.logo = value,
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
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                                color: Colors.orange,
                                onPressed: () async {
                                  if (!institucionFormProvider.isValidForm())
                                    return;
                                  await institucionService.modificarInstitucion(
                                      institucionFormProvider.institucion!);
                                  Navigator.pop(context);
                                }),
                            SizedBox(width: 5),
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
                                      textAlign: TextAlign.center,
                                      "Agregar Oferta Educativa",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  color: Colors.orange,
                                  onPressed: () {
                                    ofertaService.ofertaSeleccionada =
                                        new Oferta(
                                      idInstitucion: institucionService
                                          .institucionSeleccionado!.id!,
                                      nombre: '',
                                      proposito: '',
                                      programa: '',
                                    );
                                    ofertaService.filtrarOferta(
                                        institucionService
                                            .institucionSeleccionado!.id!);
                                    Navigator.pushNamed(
                                        context, "agregarOferta");
                                  }),
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

List<String> niveles = [
  'Nivel...',
  'Medio Superior',
  'Superior',
];

List<String> sectores = [
  'Sector...',
  'Público',
  'Privado',
];

List<String> ciudades = [
  'Ciudad...',
  'Amealco de Bonfil',
  'Arroyo Seco',
  'Cadereyta de Montes',
  'Colón',
  'Corregidora',
  'El Marqués',
  'Ezequiel Montes',
  'Huimilpan',
  'Jalpan de Serra',
  'Landa de Matamoros',
  'Pedro Escobedo',
  'Peñamiller',
  'Pinal de Amoles',  
  'Querétaro',
  'San Joaquín',
  'San Juan del Río',
  'Tequisquiapan',
  'Tolimán',
];

List<DropdownMenuItem> _creatSectores() {
  List<DropdownMenuItem> lista = [];
  sectores.forEach((element) {
    lista.add(DropdownMenuItem(child: Text(element), value: element));
  });
  return lista;
}

List<DropdownMenuItem> _crearCiudades() {
  List<DropdownMenuItem> lista = [];
  ciudades.forEach((element) {
    lista.add(DropdownMenuItem(child: Text(element), value: element));
  });
  return lista;
}

List<DropdownMenuItem> _crearNiveles() {
  List<DropdownMenuItem> lista = [];
  niveles.forEach((element) {
    lista.add(DropdownMenuItem(child: Text(element), value: element));
  });
  return lista;
}
