import 'package:eduqro/pages/services/newsletter_service.dart';
import 'package:eduqro/providers/newsletter_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CrearNewsletterPage extends StatelessWidget {
  // const CrearNewsletterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final newsletterService = Provider.of<NewsletterService>(context);
    return ChangeNotifierProvider(
      create: (_) =>
          NewsletterFormProvider(newsletterService.newsletterSeleccionado!),
      child: _NewsletterPageBody(
        newsletterService: newsletterService,
      ),
    );
  }
}

class _NewsletterPageBody extends StatelessWidget {
  // const _NewsletterPageBody({super.key});

  const _NewsletterPageBody({
    Key? key,
    required this.newsletterService,
  }) : super(key: key);

  final NewsletterService newsletterService;

  @override
  Widget build(BuildContext context) {
    TextEditingController textarea = TextEditingController();

    final newsletterFormProvider = Provider.of<NewsletterFormProvider>(context);
    final newsletter = newsletterFormProvider.newsletter;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Crear Newsletter'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            key: newsletterFormProvider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  initialValue: newsletter.asunto,
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      // labelText: 'Asunto o tema',
                      hintText: 'Asunto o tema'),
                  onChanged: (value) => newsletter.asunto = value,
                ),
                SizedBox(height: 10),
                TextFormField(
                  initialValue: newsletter.contenido,
                  cursorColor: Colors.black87,
                  // controller: textarea,
                  keyboardType: TextInputType.multiline,
                  maxLines: 15,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Contenido del boletín',
                    //hintText: 'Texto prueba - te amamos patrón'
                  ),
                  onChanged: (value) => newsletter.contenido = value,
                ),
                SizedBox(height: 10),
                Center(
                  child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "Crear Newsletter",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      color: Colors.orange,
                      onPressed: () async {
                        if (!newsletterFormProvider.isValidForm()) return;
                        await newsletterService.agregarNewsletter(
                            newsletterFormProvider.newsletter);
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
