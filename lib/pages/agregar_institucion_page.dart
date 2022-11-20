import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/institucion_form_provider.dart';
import 'services/institucion_form_service.dart';

class AgregarInstitucionPage extends StatelessWidget {
  // const AgregarInstitucionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final institucionService = Provider.of<InstitucionService>(context);

    return ChangeNotifierProvider(
      create: (_) =>
          InstitucionFormProvider(institucionService.institucionSeleccionado!),
      child: _AgregarInstitucionPageBody(
        institucionService: institucionService,
      ),
    );
  }
}

class _AgregarInstitucionPageBody extends StatelessWidget {
  const _AgregarInstitucionPageBody({
    Key? key,
    required this.institucionService,
  }) : super(key: key);

  final InstitucionService institucionService;

  @override
  Widget build(BuildContext context) {
    final institucionFormProvider =
        Provider.of<InstitucionFormProvider>(context);
    final institucion = institucionFormProvider.institucion!;

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Agregar Institución'),
            ],
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.all(15),
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
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
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
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
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
                                },                                ),
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
                          onChanged: (value) => institucion.pagina = value),
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
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),                                  
                          ),
                          onChanged: (value) => institucion.correo = value),
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
                                      borderSide:
                                          BorderSide(color: Colors.orange)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),                                            
                                ),
                                onChanged: (value) =>
                                    institucion.facebook = value),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: TextFormField(
                                  cursorColor: Colors.black54,
                                  decoration: InputDecoration(
                                    // labelText: 'Nombre',
                                    hintText: 'Instagram',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)
                                            ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),                                              
                                  ),
                                  onChanged: (value) =>
                                      institucion.instagram = value)),
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
                                      borderSide:
                                          BorderSide(color: Colors.orange)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),                                            
                                ),
                                onChanged: (value) =>
                                    institucion.cInscripcion = value),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              child: TextFormField(
                                  cursorColor: Colors.black54,
                                  decoration: InputDecoration(
                                    // labelText: 'Nombre',
                                    hintText: 'Costo por colegiatura',
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.orange)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),                                              
                                  ),
                                  onChanged: (value) =>
                                      institucion.cColegiatura = value)),
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
                          onChanged: (value) => institucion.logo = value),
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
                                "Agregar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            color: Colors.orange,
                            onPressed: () async {
                              if (!institucionFormProvider.isValidForm())
                                return;
                              await institucionService.agregarInstitucion(
                                  institucionFormProvider.institucion!);
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  )),
            ],
          ),
        )));
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
