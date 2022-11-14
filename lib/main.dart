import 'package:eduqro/pages/agregar_institucion_page.dart';
import 'package:eduqro/pages/agregar_oferta_educativa_page.dart';
import 'package:eduqro/pages/crear_newsletter_page.dart';
import 'package:eduqro/pages/editar_institucion_page.dart';
import 'package:eduqro/pages/editar_newsletter_page.dart';
import 'package:eduqro/pages/editar_oferta_educativa_page.dart';
import 'package:eduqro/pages/enviar_newsletter_page.dart';
import 'package:eduqro/pages/home_page.dart';
import 'package:eduqro/pages/login_page.dart';
import 'package:eduqro/pages/services/newsletter_service.dart';
import 'package:eduqro/pages/ver_detalles_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/services/institucion_form_service.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  // const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InstitucionService()),
        ChangeNotifierProvider(create: (_) => NewsletterService()),
      ],
      child: MyApp(),
    );
  }
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
        'verDetalles': (_) => VerDetallesPage(), 
        'editarInst': (_) => EditarInstitucionPage(),
        'agregarOferta': (_) => AgregarOfertaEducativaPage(),
        'editarOferta': (_) => EditarOfertaEducativaPage(),
        'enviarNews': (_) => EnviarNewsletterPage(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.orange,
          elevation:0,
        ))
    );
  }
}


