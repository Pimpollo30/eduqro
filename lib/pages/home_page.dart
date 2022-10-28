import 'package:eduqro/pages/acerca_de_page.dart';
import 'package:eduqro/pages/busqueda_page.dart';
import 'package:eduqro/pages/instituciones_page.dart';
import 'package:eduqro/pages/newsletter_page.dart';
import 'package:eduqro/pages/suscribirse_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

  int _selectedIndex = 0;
  final _pageController = PageController(initialPage: 0);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Oferta Eduqro")),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [
          BusquedaForm(),
          SuscribirsePage(),
          InstitucionesPage(),
          NewsletterPage(),
          AcercaDePage(),
          ],
      ),
      bottomNavigationBar: Navbar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, "agregarInst");
        },
      ),
    );
  }
}

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _navList(),
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(_selectedIndex, duration: Duration(microseconds: 300), curve: Curves.easeIn);
        });
        print("Index: "+_selectedIndex.toString());
      },
      currentIndex: _selectedIndex,
    );
  }
}

List<BottomNavigationBarItem> _navList() {
  return [
    BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio'
          ),
      BottomNavigationBarItem(
        icon: Icon(Icons.mail),
        label: 'Suscribirse'
        ),  
      BottomNavigationBarItem(
        icon: Icon(Icons.backpack),
        label: 'Instituciones'
        ),          
      BottomNavigationBarItem(
        icon: Icon(Icons.newspaper),
        label: 'Newsletter'
        ),                 
      BottomNavigationBarItem(
        icon: Icon(Icons.info),
        label: 'Acerca de'
        ),
      ];
}