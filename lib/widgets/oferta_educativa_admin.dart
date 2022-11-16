import 'package:eduqro/models/oferta.dart';
import 'package:eduqro/pages/services/oferta_form_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfertaEducativaAdminCard extends StatelessWidget {
  // const OfertaEducativaAdminCard({super.key});

  final Oferta oferta;
  final int index;

  const OfertaEducativaAdminCard(
      {Key? key, required this.oferta, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ofertaService = Provider.of<OfertaService>(context);
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(10)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          oferta.nombre,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Propósito del programa educativo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          oferta.proposito,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "Programa académico",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          oferta.programa,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: IconButton(
                  onPressed: () {
                    ofertaService.ofertaSeleccionada =
                        ofertaService.ofertas[index].copy();
                    Navigator.pushNamed(context, "editarOferta");
                  },
                  icon: Icon(Icons.edit)),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(width: 10),
            Container(
              child: IconButton(
                  onPressed: () {}, icon: Icon(Icons.delete_outline)),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10)),
            )
          ],
        )),
      ]),
    );
  }
}
