import 'package:eduqro/providers/login_form_provider.dart';
import 'package:eduqro/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  // const LoginPage({super.key}); ChangeNotifierProvider(create: (_) => LoginFormProvider(), child: _LoginForm()),

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
      body: ChangeNotifierProvider(
          create: (_) => LoginFormProvider(), child: _Login()),
    );
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: loginForm.formKey,
        child: Column(
          children: [
            TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.orange),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  // labelText: 'Usuario o Correo Electronico',
                  hintText: 'Correo electrónico',
                ),
                onChanged: (value) => loginForm.email = value,
                validator: (value) {
                  String pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                      ? null
                      : 'El correo no es válido';
                }),
            SizedBox(height: 10),
            TextFormField(
              autocorrect: false,
              obscureText: true,
              cursorColor: Colors.black54,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.orange),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  // labelText: 'Contraseña',
                  hintText: 'Contraseña'),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                if (value != null && value.length >= 6) return null;
                return 'La contraseña debe ser de al menos 6 caracteres';
              },
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
                onPressed: () async {
                  if (!loginForm.isValidForm()) return;
                  final authService =
                      Provider.of<AuthService>(context, listen: false);
                  final String? resp = await authService.iniciarSesion(
                      loginForm.email, loginForm.password);
                  if (resp == null) {
                    Navigator.pop(context);
                  } else {
                    // print(resp);
                    var snackBar = SnackBar(
                      content: Text("Usuario o contraseña incorrectos!"),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
