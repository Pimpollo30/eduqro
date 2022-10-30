import 'package:flutter/material.dart';

class AcercaDePage extends StatelessWidget {
  const AcercaDePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height:10),
          Text("Desarrollado por:",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),),
          SizedBox(height:10),
          Text("Brito Hernández Juan Carlos",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:16
          ),),
          Text("Espinoza Herrera Juan Carlos",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:16
          ),),
          Text("Lara Garduño Hayim Yael",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:16
          ),),
          Text("Raymundo García José Abraham",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:16
          ),),
          Text("Santos Bonilla Concepción Gabriela",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize:16
          ),),
          SizedBox(height:10),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text:"Grupo: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                TextSpan(
                  text:"DS01SV-21"
                )
              ],
              )),
          SizedBox(height:10),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text:"Carrera: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
                TextSpan(
                  text:"Desarrollo y Gestión Software"
                )
              ],
              )),
          SizedBox(height:10),
          Text(
            "Aplicación móvil desarrollada para la materia de Desarrollo Móvil Integral",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize:16,
            )
            ),
        ],
      ),
    );
  }
}