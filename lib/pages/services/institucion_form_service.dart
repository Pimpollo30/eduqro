import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/institucion.dart';

class InstitucionService extends ChangeNotifier {
    final String _baseUrl = "eduqro-18b27-default-rtdb.firebaseio.com";

    final List<Institucion> instituciones = [];

    bool isLoading = true;
    bool isSaving = false;

    Institucion? institucionSeleccionado;

    notifyListeners();

    InstitucionService() {
    }

  Future obtenerInstituciones() async {
    final url = Uri.https(_baseUrl, "instituciones.json");
    final resp = await http.get(url);

    final Map<String,dynamic> institucionesMap = json.decode(resp.body);

    institucionesMap.forEach((key, value) {
      final institucionTemp = Institucion.fromMap(value);
      institucionTemp.id = key;
      this.instituciones.add(institucionTemp);
    });

    this.isLoading = false;
    notifyListeners();
    return this.instituciones;
  }

  Future<String> agregarInstitucion(Institucion institucion) async {
    isSaving = true;
    notifyListeners();
    final url = Uri.https(_baseUrl,"instituciones.json");
    final resp = await http.post(url,body: institucion.toJson());
    final decodedData = json.decode(resp.body);
    print(decodedData["name"]);
    institucion.id = decodedData["name"];
    this.instituciones.add(institucion);
    return institucion.id!;
  }
  

}