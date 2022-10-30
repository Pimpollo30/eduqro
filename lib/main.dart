import 'package:eduqro/pages/agregar_institucion_page.dart';
import 'package:eduqro/pages/crear_newsletter_page.dart';
import 'package:eduqro/pages/editar_newsletter_page.dart';
import 'package:eduqro/pages/home_page.dart';
import 'package:eduqro/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      title: 'Oferta Eduqro',
      routes: {
        'home': (_) => HomePage(),
        'agregarInst': (_) => AgregarInstitucionPage(), 
        'crearNews': (_) => CrearNewsletterPage(),
        'editarNews': (_) => EditarNewsletterPage(),
        'login': (_) => LoginPage(),
      },
    );
  }
}


