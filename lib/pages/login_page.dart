import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Iniciar Sesión'),
          ],
        ),
      ),
      body: _Login(),
    );
  }
}

class _Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Usuario o Correo Electronico',
              hintText: 'Ej: juan@hotmail.com',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Contraseña',
              hintText: '******'
            ),
          ),
        ),
        Center(child: FloatingActionButton.extended(onPressed: (){}, label: Text('Iniciar Sesión',), elevation: 0,),),
      ],
    );
  }
}