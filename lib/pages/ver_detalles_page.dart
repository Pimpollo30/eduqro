import 'package:eduqro/widgets/oferta_educativa_card.dart';
import 'package:flutter/material.dart';

class VerDetallesPage extends StatelessWidget {
  // const VerDetallesPage({super.key});
  final GlobalKey expansionTileKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalles")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image(image: AssetImage('assets/no-image.png'),
              width: double.infinity,
              height:200,
              fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            SizedBox(height:10),
            Text("Nombre de la institución",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize:17
            )),
            Text("Dirección de la institución",
            style: TextStyle(
              color: Colors.black87,
              fontSize:15
            )),
            SizedBox(height:20),
            Text("Contacto",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize:17
            )),          
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Container(
                      child: Icon(Icons.link, size:18),
                      padding: EdgeInsets.only(right: 10)
                      ),
                    ),
                  TextSpan(
                    text: "www.ejemplo.edu.mx",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
            ])),
            SizedBox(height:5),          
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Container(
                      child: Icon(Icons.mail, size:18),
                      padding: EdgeInsets.only(right: 10)
                      ),
                    ),
                  TextSpan(
                    text: "ejemplo@abc.edu.mx",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
            ])),    
            SizedBox(height:5),          
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Container(
                      child: Icon(Icons.phone, size:18),
                      padding: EdgeInsets.only(right: 10)
                      ),
                    ),
                  TextSpan(
                    text: "XXXXXXXXXX",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
            ])),        
            SizedBox(height:5),          
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Container(
                      child: Icon(Icons.facebook, size:18),
                      padding: EdgeInsets.only(right: 10)
                      ),
                    ),
                  TextSpan(
                    text: "Facebook",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
            ])),    
            SizedBox(height:5),          
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    child: Container(
                      child: Icon(Icons.photo_camera, size:17),
                      padding: EdgeInsets.only(right: 10)
                      ),
                    ),
                  TextSpan(
                    text: "Instagram",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    )),
            ])),          
            SizedBox(height:20),
            Text("Costos",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize:17
            )),
            Text("Inscripción: \$1000 | Colegiatura: \$1000",
            style: TextStyle(
              color: Colors.black87,
              fontSize:15
            )),        
            SizedBox(height:10),
  
            ExpansionTile(
            title: Text("Oferta Educativa",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize:17
            )),  
            controlAffinity: ListTileControlAffinity.trailing,
            children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) => GestureDetector(
                  child: OfertaEducativaCard(),
                  )),
            ],
          ),                        
          ],
        ),),
      ),
    );
  }
}