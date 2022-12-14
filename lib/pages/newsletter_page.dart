import 'package:eduqro/models/newsletter.dart';
import 'package:eduqro/pages/loading_page.dart';
import 'package:eduqro/services/newsletter_service.dart';
import 'package:eduqro/providers/newsletter_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/newsletter_card.dart';

class NewsletterPage extends StatelessWidget {
  // const NewsletterPage({super.key});

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
    final newsletterService = Provider.of<NewsletterService>(context);
    if (newsletterService.isLoading) return LoadingPage();
    var estilo =
        TextStyle(fontWeight: FontWeight.w500, fontSize: 20, height: 0);
    return Container(
      child: Stack(
        children: [
          ListView.builder(
            itemCount: newsletterService.newsletters.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child: NewsletterCard(
                  newsletter: newsletterService.newsletters[index],
                ),
                onTap: () {
                  newsletterService.newsletterSeleccionado =
                      newsletterService.newsletters[index].copy();
                  Navigator.pushNamed(context, "editarNews");
                },
              );
            },
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: Colors.orange,
              heroTag: "crearNews",
              child: Icon(Icons.add),
              onPressed: () {
                newsletterService.newsletterSeleccionado = new Newsletter(
                  asunto: '',
                  contenido: '',
                  fecha: '',
                );
                Navigator.pushNamed(context, "crearNews");
              },
            ),
          ),
        ],
      ),
    );
  }
}
