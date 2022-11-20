// import 'package:eduqro/widgets/navigation_bar.dart';
import 'package:eduqro/pages/loading_page.dart';
import 'package:eduqro/services/institucion_form_service.dart';
import 'package:eduqro/services/oferta_form_service.dart';
import 'package:eduqro/pages/suscribirse_page.dart';
import 'package:eduqro/widgets/instituciones_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusquedaForm extends StatelessWidget {
  // const _BusquedaForm({super.key});

  String _nombre = "";
  String _nivel = "Nivel...";
  String _sector = "Sector...";
  String _ciudad = "Ciudad...";

  @override
  Widget build(BuildContext context) {
    final institucionService = Provider.of<InstitucionService>(context);
    final ofertaService = Provider.of<OfertaService>(context);
    if (institucionService.isLoading) return LoadingPage();
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Form(
                child: Column(
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
                  onChanged: (value) {
                    _nombre = value;
                    institucionService.buscarInstGuest(
                        _nombre, _nivel, _sector, _ciudad);
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                          value: 'Nivel...',
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                          items: _crearNiveles(),
                          onChanged: (value) {
                            _nivel = value;
                            institucionService.buscarInstGuest(
                                _nombre, _nivel, _sector, _ciudad);
                          }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                          value: 'Sector...',
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey)),
                          ),
                          items: _creatSectores(),
                          onChanged: (value) {
                            _sector = value;
                            institucionService.buscarInstGuest(
                                _nombre, _nivel, _sector, _ciudad);
                          }),
                    ),
                  ],
                ),
                SizedBox(height: 10),
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
                      institucionService.buscarInstGuest(
                          _nombre, _nivel, _sector, _ciudad);
                    }),
                // SizedBox(height:10),
                // DropdownButtonFormField(
                //   decoration: InputDecoration(
                //     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
                //     enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                //   ),
                //   items: [DropdownMenuItem(child: Text('Área o Especialidad'))],
                //   onChanged: (value) {}),
              ],
            )),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Resultados",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 10),
          ListView.builder(
              shrinkWrap: true,
              itemCount: institucionService.institucionesGuest.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => GestureDetector(
                    child: InstitucionCard(
                      institucion: institucionService.institucionesGuest[index],
                    ),
                    onTap: () async {
                      institucionService.institucionSeleccionadoGuest =
                          institucionService.instituciones[index].copy();
                      await institucionService.obtenerOfertasEducativas();
                      await institucionService.filtrarOferta();
                      Navigator.pushNamed(context, "verDetalles");
                    },
                  )),
        ]),
      ),
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
