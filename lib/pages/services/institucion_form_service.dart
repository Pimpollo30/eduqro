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
    this.obtenerInstituciones();
  }

  Future obtenerInstituciones() async {
    final url = Uri.https(_baseUrl, "instituciones.json");
    final resp = await http.get(url);

    final Map<String, dynamic> institucionesMap = json.decode(resp.body);

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
    final url = Uri.https(_baseUrl, "instituciones.json");
    final resp = await http.post(url, body: institucion.toJson());
    final decodedData = json.decode(resp.body);
    print(decodedData["name"]);
    institucion.id = decodedData["name"];
    this.instituciones.add(institucion);
    isSaving = false;
    notifyListeners();
    return institucion.id!;
  }

  Future<String> modificarInstitucion(Institucion institucion) async {
    isSaving = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "instituciones/${institucion.id}.json");
    final resp = await http.put(url, body: institucion.toJson());
    final decodedData = resp.body;
    // print(decodedData);
    //actualizamos el listado de productos
    final index = this
        .instituciones
        .indexWhere((element) => element.id == institucion.id);
    this.instituciones[index] = institucion;
    isSaving = false;
    notifyListeners();
    return institucion.id!;
  }
}
