import 'package:eduqro/models/suscripcion.dart';
import 'package:eduqro/pages/services/newsletter_service.dart';
import 'package:eduqro/providers/suscripcion_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuscribirsePage extends StatelessWidget {
  // const SuscribirsePage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsletterService = Provider.of<NewsletterService>(context);
    newsletterService.suscripcionSeleccionado = new Suscripcion(
      ciudad: 'Ciudad...',
      correo: '',
    );
    return ChangeNotifierProvider(
      create: (_) =>
          SuscripcionFormProvider(newsletterService.suscripcionSeleccionado!),
      child: _SuscribirsePageBody(
        newsletterService: newsletterService,
      ),
    );
  }
}

class _SuscribirsePageBody extends StatelessWidget {
  // const _SuscribirsePageBody({super.key});

  const _SuscribirsePageBody({
    Key? key,
    required this.newsletterService,
  }) : super(key: key);

  final NewsletterService newsletterService;

  @override
  Widget build(BuildContext context) {
    final suscripcionFormProvider =
        Provider.of<SuscripcionFormProvider>(context);
    final suscripcion = suscripcionFormProvider.suscripcion;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Form(
        key: suscripcionFormProvider.formKey,
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
                "Recibe información, acontecimientos,\nofertas o novedades acerca de las\ninstituciones de la entidad",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 10),
            TextFormField(
              cursorColor: Colors.black54,
              decoration: InputDecoration(
                // labelText: 'Correo electrónico',
                hintText: 'Correo electrónico',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
              onChanged: (value) => suscripcion.correo = value,
            ),
            SizedBox(height: 10),
            DropdownButtonFormField(
                value: 'Ciudad...',
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
                items: _crearCiudades(),
                onChanged: (value) {
                  // _ciudad = value;
                  suscripcion.ciudad = value;
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
                    "Suscribirse",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
                color: Colors.orange,
                onPressed: () async {
                  if (!suscripcionFormProvider.isValidForm()) return;
                  await newsletterService.suscribirseNewsletter(
                      suscripcionFormProvider.suscripcion);
                      const snackBar = SnackBar(
                        content: Text('Suscripción realizada correctamente!'),
                      );
                      suscripcionFormProvider.formKey.currentState?.reset();
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }),
          ],
        ),
      ),
    );
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
