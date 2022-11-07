import 'package:flutter/material.dart';

import '../widgets/newsletter_card.dart';

class NewsletterPage extends StatelessWidget {
  const NewsletterPage({super.key});

  @override
  Widget build(BuildContext context) {
    var estilo = TextStyle(fontWeight: FontWeight.w500, fontSize: 20, height: 0);
     return Container(
       child: Stack(
         children: [
            ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(child: NewsletterCard(), onTap: () {
                  Navigator.pushNamed(context, "editarNews");
                },);
              },
            ),
            Positioned(
            right:10,
            bottom: 10,
            child: FloatingActionButton(backgroundColor: Colors.orange,heroTag:"crearNews",child:Icon(Icons.add),onPressed: () {
              Navigator.pushNamed(context, "crearNews");
            },),
          ),
         ],
       ),
     );
  }
}