import 'package:eduqro/models/oferta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/institucion.dart';

class InstitucionService extends ChangeNotifier {
  final String _baseUrl = "eduqro-18b27-default-rtdb.firebaseio.com";

  final List<Institucion> resultados = [];
  final List<Institucion> instituciones = [];

  final List<Institucion> resultadosGuest = [];
  final List<Institucion> institucionesGuest = [];

  final List<Oferta> ofertas = [];
  final List<Oferta> resultadosOfertas = [];

  bool isLoading = true;
  bool isSaving = false;

  Institucion? institucionSeleccionado;
  Institucion? institucionSeleccionadoGuest;

  notifyListeners();

  InstitucionService() {
    this.obtenerInstituciones();
    // this.obtenerOfertasEducativas();
  }

  Future obtenerInstituciones() async {
    final url = Uri.https(_baseUrl, "instituciones.json");
    final resp = await http.get(url);

    if (json.decode(resp.body) == null) {
      this.isLoading = false;
      notifyListeners();
      return [];
    }
    final Map<String, dynamic> institucionesMap = json.decode(resp.body);

    institucionesMap.forEach((key, value) {
      final institucionTemp = Institucion.fromMap(value);
      institucionTemp.id = key;
      this.instituciones.add(institucionTemp);
      this.resultados.add(institucionTemp);
      this.institucionesGuest.add(institucionTemp);
      this.resultadosGuest.add(institucionTemp);
    });

    this.isLoading = false;
    notifyListeners();
  }

  Future obtenerOfertasEducativas() async {
    ofertas.clear();
    resultadosOfertas.clear();
    final url = Uri.https(_baseUrl, "ofertas.json");
    final resp = await http.get(url);

    final Map<String, dynamic> ofertasMap = json.decode(resp.body);

    ofertasMap.forEach((key, value) {
      final ofertaTemp = Oferta.fromMap(value);
      ofertaTemp.id = key;
      this.ofertas.add(ofertaTemp);
      this.resultadosOfertas.add(ofertaTemp);
    });
  }

  Future filtrarOferta() async {
    var contain = this.resultadosOfertas.where(
        (element) => element.idInstitucion == institucionSeleccionadoGuest?.id);
    this.ofertas.clear();
    contain.forEach((element) {
      this.ofertas.add(element);
    });
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
    this.resultados.add(institucion);
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
    final indexResult =
        this.resultados.indexWhere((element) => element.id == institucion.id);
    this.instituciones[index] = institucion;
    this.resultados[indexResult] = institucion;
    isSaving = false;
    notifyListeners();
    return institucion.id!;
  }

  Future<String> eliminarInstitucion(Institucion institucion) async {
    final url = Uri.https(_baseUrl, "instituciones/${institucion.id}.json");
    final resp = await http.delete(url, body: institucion.toJson());
    final decodedData = resp.body;
    // print(decodedData);
    //actualizamos el listado de productos
    final index = this
        .instituciones
        .indexWhere((element) => element.id == institucion.id);
    final indexResult =
        this.resultados.indexWhere((element) => element.id == institucion.id);
    this.instituciones.removeAt(index);
    this.resultados.removeAt(indexResult);
    notifyListeners();
    return institucion.id!;
  }

  Future buscarInstByName(String nombre) async {
    var contain = this.resultados.where((element) =>
        element.nombre.toLowerCase().contains(nombre.toLowerCase()));
    this.instituciones.clear();
    contain.forEach((element) {
      this.instituciones.add(element);
    });
    notifyListeners();
  }

  Future buscarInstGuest(
      String nombre, String nivel, String sector, String ciudad) async {
    nivel = nivel == "Nivel..." ? "" : nivel;
    sector = sector == "Sector..." ? "" : sector;
    ciudad = ciudad == "Ciudad..." ? "" : ciudad;
    // print(nivel);
    // print(sector);
    // print(ciudad);
    var contain = this.resultadosGuest.where((element) =>
        element.nombre.toLowerCase().contains(nombre.toLowerCase()) &&
        element.nivel.contains(nivel) &&
        element.sector.contains(sector) &&
        element.ciudad.contains(ciudad));
    this.institucionesGuest.clear();
    contain.forEach((element) {
      this.institucionesGuest.add(element);
    });
    notifyListeners();
  }
}
