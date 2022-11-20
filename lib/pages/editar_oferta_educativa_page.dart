import 'package:eduqro/pages/services/oferta_form_service.dart';
import 'package:eduqro/providers/oferta_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditarOfertaEducativaPage extends StatelessWidget {
  // const EditarOfertaEducativaPage({super.key});
  // TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ofertaService = Provider.of<OfertaService>(context);

    return ChangeNotifierProvider(
      create: (_) => OfertaFormProvider(ofertaService.ofertaSeleccionada!),
      child: _EditarOfertaEducativaPageBody(
        ofertaService: ofertaService,
      ),
    );
  }
}

class _EditarOfertaEducativaPageBody extends StatelessWidget {
  // const _EditarOfertaEducativaPageBody({super.key});

  const _EditarOfertaEducativaPageBody({Key? key, required this.ofertaService})
      : super(key: key);

  final OfertaService ofertaService;

  @override
  Widget build(BuildContext context) {
    final ofertaFormProvider = Provider.of<OfertaFormProvider>(context);
    final oferta = ofertaFormProvider.oferta;

    final ofertaService = Provider.of<OfertaService>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Editar Oferta Educativa")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
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
                            "Modificar",
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
                              .modificarOferta(ofertaFormProvider.oferta);
                          Navigator.pop(context);
                        }),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
