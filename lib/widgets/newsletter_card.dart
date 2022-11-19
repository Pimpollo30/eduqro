import 'package:eduqro/models/newsletter.dart';
import 'package:eduqro/pages/services/newsletter_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsletterCard extends StatelessWidget {
  const NewsletterCard({Key? key, required this.newsletter}) : super(key: key);

  final Newsletter newsletter;
  @override
  Widget build(BuildContext context) {
    final newsletterService = Provider.of<NewsletterService>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 15),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Text(
                'Fecha',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(top: 30, left: 10, child: Text(newsletter.fecha)),
            SizedBox(height: 20),
            Positioned(
              top: 50,
              left: 10,
              child: Text(
                newsletter.asunto,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Positioned(
                width: 300,
                top: 70,
                left: 10,
                child: Text(
                  newsletter.contenido,
                )),
            Positioned(
                bottom: 10,
                right: 70,
                child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        onPressed: () {
                          newsletterService.newsletterSeleccionado = newsletter.copy();
                          Navigator.pushNamed(context, "enviarNews");
                        },
                        icon: Icon(Icons.message_outlined)))),
            Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                    width: 50,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                        onPressed: () {
                          newsletterService.eliminarNewsletter(newsletter);
                        },
                        icon: Icon(Icons.delete_outline)))),
          ],
        ),
      ),
    );
  }
}
