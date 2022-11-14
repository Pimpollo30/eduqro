import 'package:flutter/material.dart';

import '../models/institucion.dart';

class InstitucionFormProvider extends ChangeNotifier {
    GlobalKey<FormState> formKey = new GlobalKey<FormState>();
    
    Institucion institucion;

    InstitucionFormProvider(this.institucion);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }


}