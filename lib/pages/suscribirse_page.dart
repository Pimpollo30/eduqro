import 'package:flutter/material.dart';

class SuscribirsePage extends StatelessWidget {
  const SuscribirsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      child: Form(
        child: Column(
          children: [
            SizedBox(height:10),
            Text(
              "Recibe información, acontecimientos,\nofertas o novedades acerca de las\ninstituciones de la entidad",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontSize:17,
                fontWeight: FontWeight.bold,
              )
              ),
            SizedBox(height:10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Correo electrónico',
                hintText: 'Correo electrónico',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height:10),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: [DropdownMenuItem(child: Text('Ciudad'))], 
              onChanged: (value) {}),
            SizedBox(height:10),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  "Suscribirse",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    ),
                  ),
              ),
              color: Colors.blue,
              onPressed: () {}
              )
          ],
        ),
      ),
    );
  }
}