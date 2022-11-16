import 'dart:convert';

class Oferta {


  Oferta({this.id, required this.idInstitucion, required this.nombre, required this.proposito, required this.programa});

  String? id;
  String idInstitucion;
  String nombre;
  String proposito;
  String programa;

  factory Oferta.fromJson(String str) => Oferta.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());


    factory Oferta.fromMap(Map<String, dynamic> json) => Oferta(
        idInstitucion: json["idInstitucion"],
        nombre: json["nombre"],
        proposito: json["proposito"],
        programa: json["programa"],
    );

    Map<String, dynamic> toMap() => {
        "idInstitucion": idInstitucion,
        "nombre": nombre,
        "proposito" : proposito,
        "programa" : programa
    };

    Oferta copy() => Oferta(
      idInstitucion: this.idInstitucion,
      nombre: this.nombre,
      proposito: this.proposito,
      programa: this.programa,
      id: this.id,
    );
}