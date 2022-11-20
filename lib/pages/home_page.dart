import 'package:eduqro/pages/acerca_de_page.dart';
import 'package:eduqro/pages/busqueda_page.dart';
import 'package:eduqro/pages/instituciones_page.dart';
import 'package:eduqro/pages/newsletter_page.dart';
import 'package:eduqro/pages/suscribirse_page.dart';
import 'package:eduqro/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  // const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _selectedIndex = 0;
bool toggledIndex = false;
final _pageController = PageController(initialPage: _selectedIndex);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    if (authService.isLogged == true && toggledIndex == false) {
      toggledIndex = true;
      setState(() {
        _pageController.jumpToPage(0);
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Oferta Eduqro"),
        actions: [
          IconButton(
              onPressed: () {
                if (authService.isLogged == false) {
                  Navigator.pushNamed(context, "login");
                }
              },
              icon: Icon(Icons.account_circle))
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: authService.isLogged == true
            ? _pageViewList()
            : _pageViewListGuest(),
      ),
      bottomNavigationBar: Navbar(),
    );
  }
}

class Navbar extends StatefulWidget {
  // const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return BottomNavigationBar(
      fixedColor: Colors.orange,
      type: BottomNavigationBarType.fixed,
      items: authService.isLogged == true ? _navList() : _navListGuest(),
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          _pageController.animateToPage(_selectedIndex,
              duration: Duration(microseconds: 300), curve: Curves.easeIn);
        });
        // print("Index: "+_selectedIndex.toString());
      },
      currentIndex: _selectedIndex,
    );
  }
}

List<Widget> _pageViewList() {
  return [
    BusquedaForm(),
    SuscribirsePage(),
    InstitucionesPage(),
    NewsletterPage(),
    AcercaDePage(),
  ];
}

List<Widget> _pageViewListGuest() {
  return [
    BusquedaForm(),
    SuscribirsePage(),
    AcercaDePage(),
  ];
}

List<BottomNavigationBarItem> _navList() {
  return [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
    BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Suscribirse'),
    BottomNavigationBarItem(icon: Icon(Icons.backpack), label: 'Instituciones'),
    BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'Newsletter'),
    BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Acerca de'),
  ];
}

List<BottomNavigationBarItem> _navListGuest() {
  return [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
    BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Suscribirse'),
    BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Acerca de'),
  ];
}
