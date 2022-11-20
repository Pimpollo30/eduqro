import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends ChangeNotifier {
  final String _baseUri = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyAQMH4eEzpEDM3bJ1uquRNEleR2fuoeKc4';

  bool isLogged = false;

  Future<String?> iniciarSesion(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
    };
    final url = Uri.https(
        _baseUri, "v1/accounts:signInWithPassword", {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    // print(decodedResp);

    if (decodedResp.containsKey('idToken')) {
      this.isLogged = true;
      notifyListeners();
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }
}
