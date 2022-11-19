import 'dart:convert';

class Suscripcion {
  Suscripcion({required this.correo, required this.ciudad});

  String correo;
  String ciudad;

  factory Suscripcion.fromJson(String str) =>
      Suscripcion.fromMap(json.decode(str));
  String toJson() => json.encode(toMap());

  factory Suscripcion.fromMap(Map<String, dynamic> json) => Suscripcion(
        ciudad: json["ciudad"],
        correo: json["correo"],
      );

  Map<String, dynamic> toMap() => {
        "ciudad": ciudad,
        "correo": correo,
      };

  Suscripcion copy() => Suscripcion(
        ciudad: this.ciudad,
        correo: this.correo,
      );
}
