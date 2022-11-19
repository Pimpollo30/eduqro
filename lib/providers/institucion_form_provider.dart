import 'package:eduqro/models/oferta.dart';
import 'package:flutter/material.dart';

import '../models/institucion.dart';

class InstitucionFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Institucion? institucion;
  List<Oferta>? ofertas;

  InstitucionFormProvider(this.institucion);

  InstitucionFormProvider.withOfertas(Institucion inst, List<Oferta> ofr) {
    this.institucion = inst;
    this.ofertas = ofr;
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
