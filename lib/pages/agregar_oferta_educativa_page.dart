import 'package:eduqro/pages/services/oferta_form_service.dart';
import 'package:eduqro/providers/oferta_form_provider.dart';
import 'package:eduqro/widgets/oferta_educativa_admin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgregarOfertaEducativaPage extends StatelessWidget {
  // const AgregarOfertaEducativaPage({super.key});
  var estilo = TextStyle(fontWeight: FontWeight.w500, fontSize: 20);

  @override
  Widget build(BuildContext context) {
    final ofertaService = Provider.of<OfertaService>(context);

    return ChangeNotifierProvider(
      create: (_) => OfertaFormProvider(ofertaService.ofertaSeleccionada!),
      child: _AgregarOfertaEducativaPageBody(
        ofertaService: ofertaService,
      ),
    );
  }
}

class _AgregarOfertaEducativaPageBody extends StatelessWidget {
  // const _AgregarOfertaEducativaPageBody({super.key});

  const _AgregarOfertaEducativaPageBody({
    Key? key,
    required this.ofertaService,
  }) : super(key: key);

  final OfertaService ofertaService;

  @override
  Widget build(BuildContext context) {
    // TextEditingController textarea = TextEditingController();
    final ofertaFormProvider = Provider.of<OfertaFormProvider>(context);
    final oferta = ofertaFormProvider.oferta;
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
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: ofertaService.ofertas.length,
                        itemBuilder: (context, index) => GestureDetector(
                              child: OfertaEducativaAdminCard(
                                oferta: ofertaService.ofertas[index],
                                index: index,
                              ),
                            )),
                  ],
                ),
                Form(
                    key: ofertaFormProvider.formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        TextFormField(
                          initialValue: oferta.nombre,
                          cursorColor: Colors.black87,
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
                          onChanged: (value) => oferta.nombre = value,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          initialValue: oferta.proposito,
                          cursorColor: Colors.black87,
                          // controller: textarea,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            // labelText: 'Propósito del programa educativo',
                            hintText: 'Propósito del programa educativo',
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
                          onChanged: (value) => oferta.proposito = value,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          initialValue: oferta.programa,
                          cursorColor: Colors.black87,
                          // controller: textarea,
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            // labelText: 'Programa Académico',
                            hintText: 'Programa Académico',
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
                          onChanged: (value) => oferta.programa = value,
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
                            onPressed: () async {
                              if (!ofertaFormProvider.isValidForm()) return;
                              await ofertaService
                                  .agregerOferta(ofertaFormProvider.oferta);
                              Navigator.pop(context);
                            }),
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
