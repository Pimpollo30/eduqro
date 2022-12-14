import 'package:eduqro/models/oferta.dart';
import 'package:eduqro/pages/loading_page.dart';
import 'package:eduqro/services/institucion_form_service.dart';
import 'package:eduqro/services/oferta_form_service.dart';
import 'package:eduqro/providers/institucion_form_provider.dart';
import 'package:eduqro/widgets/oferta_educativa_admin.dart';
import 'package:eduqro/widgets/oferta_educativa_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerDetallesPage extends StatelessWidget {
  // const VerDetallesPage({super.key});
  final GlobalKey expansionTileKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final institucionService = Provider.of<InstitucionService>(context);
    return ChangeNotifierProvider(
      create: (_) => InstitucionFormProvider.withOfertas(
          institucionService.institucionSeleccionadoGuest!,
          institucionService.ofertas),
      child: _VerDetallesPageBody_(
        institucionService: institucionService,
      ),
    );
  }
}

class _VerDetallesPageBody_ extends StatelessWidget {
  // const _VerDetallesPageBody_({super.key});

  const _VerDetallesPageBody_({
    Key? key,
    required this.institucionService,
  }) : super(key: key);

  final InstitucionService institucionService;

  @override
  Widget build(BuildContext context) {
    final institucionFormProvider =
        Provider.of<InstitucionFormProvider>(context);
    final institucion = institucionFormProvider.institucion!;
    final List<Oferta> ofertas = institucionFormProvider.ofertas!;
    return Scaffold(
      appBar: AppBar(title: Text("Detalles")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // width: double.infinity,
                constraints: BoxConstraints(minWidth: double.infinity, minHeight: 200),
                child: ClipRRect(
                  child: institucion.logo == null || institucion.logo == ""
                      ? Image(
                          image: AssetImage('assets/no-image.png'),
                          fit: BoxFit.cover,
                        )
                      : FadeInImage(
                          placeholder: AssetImage('assets/jar-loading.gif'),
                          image: NetworkImage(institucion.logo!),
                          fit: BoxFit.fitWidth,
                        ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 10),
              Text(institucion.nombre,
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              Text(institucion.direccion,
                  style: TextStyle(color: Colors.black87, fontSize: 15)),
              SizedBox(height: 20),
              Text("Contacto",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                  child: Container(
                      child: Icon(Icons.link, size: 18),
                      padding: EdgeInsets.only(right: 10)),
                ),
                TextSpan(
                    text: institucion.pagina == null || institucion.pagina == "" ? '-' : institucion.pagina,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
              ])),
              SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                  child: Container(
                      child: Icon(Icons.mail, size: 18),
                      padding: EdgeInsets.only(right: 10)),
                ),
                TextSpan(
                    text: institucion.correo == null || institucion.correo == "" ? '-' : institucion.correo,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
              ])),
              SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                  child: Container(
                      child: Icon(Icons.phone, size: 18),
                      padding: EdgeInsets.only(right: 10)),
                ),
                TextSpan(
                    text: institucion.telefono == null || institucion.telefono == "" ? '-' : institucion.telefono,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
              ])),
              SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                  child: Container(
                      child: Icon(Icons.facebook, size: 18),
                      padding: EdgeInsets.only(right: 10)),
                ),
                TextSpan(
                    text: institucion.facebook == null || institucion.facebook == "" ? '-' : institucion.facebook,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
              ])),
              SizedBox(height: 5),
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                  child: Container(
                      child: Icon(Icons.photo_camera, size: 17),
                      padding: EdgeInsets.only(right: 10)),
                ),
                TextSpan(
                    text: institucion.instagram == null || institucion.instagram == "" ? '-' : institucion.instagram,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
              ])),
              SizedBox(height: 20),
              Text("Costos",
                  style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 17)),
              Text(
                  "Inscripci??n: \$${institucion.cInscripcion == null || institucion.cInscripcion == "" ? '0' : institucion.cInscripcion} | Colegiatura: \$${institucion.cColegiatura == null || institucion.cColegiatura == "" ? '0' : institucion.cColegiatura}",
                  style: TextStyle(color: Colors.black87, fontSize: 15)),
              SizedBox(height: 10),
              ExpansionTile(
                title: Text("Oferta Educativa",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 17)),
                controlAffinity: ListTileControlAffinity.trailing,
                children: <Widget>[
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: institucionFormProvider.ofertas!.length,
                      itemBuilder: (context, index) => GestureDetector(
                            child: OfertaEducativaCard(
                              oferta: institucionFormProvider.ofertas!
                                  .elementAt(index),
                              index: index,
                            ),
                          )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
