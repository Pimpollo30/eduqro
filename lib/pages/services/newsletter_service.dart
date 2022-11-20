import 'package:eduqro/models/newsletter.dart';
import 'package:eduqro/models/suscripcion.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

class NewsletterService extends ChangeNotifier {
  final String _baseUrl = "eduqro-18b27-default-rtdb.firebaseio.com";

  bool isLoading = true;
  bool isSaving = false;

  Suscripcion? suscripcionSeleccionado;
  Newsletter? newsletterSeleccionado;

  final List<Newsletter> newsletters = [];
  final List<Suscripcion> suscripcionesResultados = [];
  final List suscripciones = [];

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


  Future obtenerSuscritos() async {
    suscripcionesResultados.clear();
    final url = Uri.https(_baseUrl, "suscripciones.json");
    final resp = await http.get(url);

    if (json.decode(resp.body) == null) {
      return [];
    }
    final Map<String, dynamic> suscripcionesMap = json.decode(resp.body);

    suscripcionesMap.forEach((key, value) {
      final newsletterTemp = Suscripcion.fromMap(value);
      this.suscripcionesResultados.add(newsletterTemp);
      this.suscripciones.add(newsletterTemp.correo);
    });
  }

    Future filtrarSuscritos(String ciudad) async {
    var contain =
        this.suscripcionesResultados.where((element) => element.ciudad == ciudad);
    this.suscripciones.clear();
    contain.forEach((element) {
      this.suscripciones.add(element.correo);
    });
  }

  

  Future suscribirseNewsletter(Suscripcion suscripcion) async {
    isSaving = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "suscripciones.json");
    final resp = await http.post(url, body: suscripcion.toJson());
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

  Future<dynamic> cargarPass() async { 
    final resp = await rootBundle.loadString('assets/data.txt');
    final resJSON = json.decode(resp);
  
    return resJSON;
  }

  Future enviarNewsletter(Newsletter newsletter, {String ciudad = ""}) async {
      await this.obtenerSuscritos();
      if (ciudad != "") {
        await this.filtrarSuscritos(ciudad);
      }
      if (suscripciones.isEmpty) {
        return;
      }
      Map dataJSON = await cargarPass();
      final username = dataJSON["correo"];
      final password = dataJSON["pw"];
      final smtpServer = SmtpServer(
        'smtp-relay.sendinblue.com',
        port: 587,
        username: username,
        password: password,
      );

    final message = Message()
      ..from = Address(dataJSON["correo"],'eduqro')
      // ..recipients = suscripciones
      ..bccRecipients = suscripciones
      ..subject = "Eduqro - "+newsletter.asunto
      ..text = newsletter.contenido;

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.: ');
      print("=="+e.message+"==");
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
  
}
