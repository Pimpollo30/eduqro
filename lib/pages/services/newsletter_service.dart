import 'package:eduqro/models/newsletter.dart';
import 'package:eduqro/models/suscripcion.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class NewsletterService extends ChangeNotifier {
  final String _baseUrl = "eduqro-18b27-default-rtdb.firebaseio.com";

  bool isLoading = true;
  bool isSaving = false;

  Suscripcion? suscripcionSeleccionado;
  Newsletter? newsletterSeleccionado;

  final List<Newsletter> newsletters = [];

  notifyListeners();

  NewsletterService() {
    this.obtenerNewsletters();
  }

  Future obtenerNewsletters() async {
    final url = Uri.https(_baseUrl, "newsletters.json");
    final resp = await http.get(url);

    if (json.decode(resp.body) == null) {
      this.isLoading = false;
      notifyListeners();
      return [];
    }
    final Map<String, dynamic> newslettersMap = json.decode(resp.body);

    newslettersMap.forEach((key, value) {
      final newsletterTemp = Newsletter.fromMap(value);
      newsletterTemp.id = key;
      this.newsletters.add(newsletterTemp);
    });

    this.isLoading = false;
    notifyListeners();
    return this.newsletters;
  }

  Future<String> suscribirseNewsletter(Suscripcion suscripcion) async {
    isSaving = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "suscripciones.json");
    final resp = await http.post(url, body: suscripcion.toJson());
    final decodedData = json.decode(resp.body);
    print(decodedData["name"]);
    suscripcion.id = decodedData["name"];
    return suscripcion.id!;
  }

  Future<String> agregarNewsletter(Newsletter newsletter) async {
    final now = DateTime.now();
    final dateFormat = DateFormat('yyyy/MM/dd');
    newsletter.fecha = dateFormat.format(now);
    isSaving = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "newsletters.json");
    final resp = await http.post(url, body: newsletter.toJson());
    final decodedData = json.decode(resp.body);
    print(decodedData["name"]);
    newsletter.id = decodedData["name"];
    this.newsletters.add(newsletter);
    isSaving = false;
    notifyListeners();
    return newsletter.id!;
  }

  Future<String> modificarNewsletter(Newsletter newsletter) async {
    isSaving = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "newsletters/${newsletter.id}.json");
    final resp = await http.put(url, body: newsletter.toJson());
    final decodedData = resp.body;
    // print(decodedData);
    //actualizamos el listado de productos
    final index =
        this.newsletters.indexWhere((element) => element.id == newsletter.id);
    this.newsletters[index] = newsletter;
    isSaving = false;
    notifyListeners();
    return newsletter.id!;
  }

  Future<String> eliminarNewsletter(Newsletter newsletter) async {
    isSaving = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "newsletters/${newsletter.id}.json");
    final resp = await http.delete(url, body: newsletter.toJson());
    final decodedData = resp.body;
    // print(decodedData);
    //actualizamos el listado de productos
    final index =
        this.newsletters.indexWhere((element) => element.id == newsletter.id);
    this.newsletters.removeAt(index);
    isSaving = false;
    notifyListeners();
    return newsletter.id!;
  }
}
