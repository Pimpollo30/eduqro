import 'dart:convert';

class Institucion {
  
  Institucion({this.id, required this.nombre, required this.nivel, required this.sector, required this.ciudad, required this.direccion, this.pagina, this.correo, this.facebook, this.instagram, this.cInscripcion, this.cColegiatura, required this.telefono });

  String? id;
  String nombre;
  String nivel;
  String sector;
  String ciudad;
  String direccion;
  String? pagina;
  String? correo;
  String? facebook;
  String? instagram;
  String? cInscripcion;
  String? cColegiatura;
  String telefono;

    factory Institucion.fromJson(String str) => Institucion.fromMap(json.decode(str));
    String toJson() => json.encode(toMap());

    factory Institucion.fromMap(Map<String, dynamic> json) => Institucion(
        nombre: json["nombre"],
        nivel: json["nivel"],
        sector: json["sector"],
        ciudad: json["ciudad"],
        direccion: json["direccion"],
        pagina: json["pagina"],
        correo: json["correo"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        cInscripcion: json["cInscripcion"],
        cColegiatura: json["cColegiatura"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "nivel": nivel,
        "sector": sector,
        "ciudad": ciudad,
        "direccion": direccion,
        "pagina": pagina,
        "correo": correo,
        "facebook": facebook,
        "instagram": instagram,
        "cInscripcion": cInscripcion,
        "cColegiatura": cColegiatura,
        "telefono": telefono,
    };

    Institucion copy() => Institucion(
      nombre: this.nombre,
      nivel: this.nivel,
      sector: this.sector,
      ciudad: this.ciudad,
      direccion: this.direccion,
      pagina: this.pagina,
      correo: this.correo,
      facebook: this.facebook,
      instagram: this.instagram,
      cInscripcion: this.cInscripcion,
      cColegiatura: this.cColegiatura,
      telefono: this.telefono,
      id: this.id,
    );
}