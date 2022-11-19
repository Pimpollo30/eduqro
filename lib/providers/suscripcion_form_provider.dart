import 'package:eduqro/models/suscripcion.dart';
import 'package:flutter/material.dart';

class SuscripcionFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Suscripcion suscripcion;

  SuscripcionFormProvider(this.suscripcion);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
