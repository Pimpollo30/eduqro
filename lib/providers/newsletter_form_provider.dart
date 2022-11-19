import 'package:eduqro/models/newsletter.dart';
import 'package:eduqro/models/suscripcion.dart';
import 'package:flutter/material.dart';

class NewsletterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  Newsletter newsletter;

  NewsletterFormProvider(this.newsletter);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
