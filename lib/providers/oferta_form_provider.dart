import 'package:eduqro/models/newsletter.dart';
import 'package:eduqro/models/oferta.dart';
import 'package:eduqro/models/suscripcion.dart';
import 'package:flutter/material.dart';

class OfertaFormProvider extends ChangeNotifier {
    GlobalKey<FormState> formKey = new GlobalKey<FormState>();
    
    Oferta oferta;

    OfertaFormProvider(this.oferta);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }


}