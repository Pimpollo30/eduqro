import 'package:eduqro/models/oferta.dart';
import 'package:eduqro/services/institucion_form_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/institucion.dart';

class OfertaService extends ChangeNotifier {
  final String _baseUrl = "eduqro-18b27-default-rtdb.firebaseio.com";
  String idInst = '';
  final List<Oferta> ofertas = [];
  final List<Oferta> resultados = [];

  bool isLoading = true;
  bool isSaving = false;

  Oferta? ofertaSeleccionada;

  notifyListeners();

  OfertaService() {
    this.obtenerOfertasEducativas();
  }

  Future obtenerOfertasEducativas() async {
    final url = Uri.https(_baseUrl, "ofertas.json");
    final resp = await http.get(url);
    if (json.decode(resp.body) == null) {
      this.isLoading = false;
      notifyListeners();
      return [];
    }

    final Map<String, dynamic> ofertasMap = json.decode(resp.body);

    ofertasMap.forEach((key, value) {
      final ofertaTemp = Oferta.fromMap(value);
      ofertaTemp.id = key;
      this.ofertas.add(ofertaTemp);
      this.resultados.add(ofertaTemp);
    });
  }

  Future filtrarOferta(String id) async {
    var contain =
        this.resultados.where((element) => element.idInstitucion == id);
    this.ofertas.clear();
    contain.forEach((element) {
      this.ofertas.add(element);
    });
  }

  Future<String> agregerOferta(Oferta oferta) async {
    isSaving = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "ofertas.json");
    final resp = await http.post(url, body: oferta.toJson());
    final decodedData = json.decode(resp.body);
    print(decodedData["name"]);
    oferta.id = decodedData["name"];
    this.ofertas.add(oferta);
    isSaving = false;
    notifyListeners();
    return oferta.id!;
  }

  Future<String> modificarOferta(Oferta oferta) async {
    isSaving = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "ofertas/${oferta.id}.json");
    final resp = await http.put(url, body: oferta.toJson());
    final decodedData = resp.body;
    // print(decodedData);
    //actualizamos el listado de productos
    final index = this.ofertas.indexWhere((element) => element.id == oferta.id);
    this.ofertas[index] = oferta;

    isSaving = false;
    notifyListeners();
    return oferta.id!;
  }

  Future<String> eliminarOferta(Oferta oferta) async {
    final url = Uri.https(_baseUrl, "ofertas/${oferta.id}.json");
    final resp = await http.delete(url, body: oferta.toJson());
    final decodedData = resp.body;
    // print(decodedData);
    //actualizamos el listado de productos
    final index = this.ofertas.indexWhere((element) => element.id == oferta.id);
    final indexResult =
        this.resultados.indexWhere((element) => element.id == oferta.id);
    this.ofertas.removeAt(index);
    this.resultados.removeAt(indexResult);
    notifyListeners();
    return oferta.id!;
  }
}
