import 'dart:convert';

class Newsletter {


  Newsletter({this.id, required this.asunto, required this.contenido, required this.fecha});

  String? id;
  String asunto;
  String contenido;
  String fecha;

  factory Newsletter.fromJson(String str) => Newsletter.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());


    factory Newsletter.fromMap(Map<String, dynamic> json) => Newsletter(
        asunto: json["asunto"],
        contenido: json["contenido"],
        fecha: json["fecha"],
    );

    Map<String, dynamic> toMap() => {
        "asunto": asunto,
        "contenido": contenido,
        "fecha" : fecha,
    };

    Newsletter copy() => Newsletter(
      asunto: this.asunto,
      contenido: this.contenido,
      id: this.id,
      fecha: this.fecha,
    );
}