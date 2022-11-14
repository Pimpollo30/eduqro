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
            Text('Iniciar sesión'),
          ],
        ),
      ),
      body: _Login(),
    );
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.black54,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                // labelText: 'Usuario o Correo Electronico',
                hintText: 'Correo electrónico',
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              cursorColor: Colors.black54,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  // labelText: 'Contraseña',
                  hintText: 'Contraseña'),
            ),
            SizedBox(height: 10),
            MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    "Iniciar sesión",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
                color: Colors.orange,
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
