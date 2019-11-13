import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:restaurantemobileflutter/src/models/Usuario.dart';

const request = 'http://192.168.1.8:45455/api/';
http.Client client = http.Client();

Future<Usuario> getUsuario(
    String controller, String idUsuario, String token) async {
  final response = await client.get(request + controller + idUsuario,
      headers: {HttpHeaders.authorizationHeader: token});

  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

  return parsed.map<Usuario>((json) => Usuario.fromJson(json));
}

Future<List<Usuario>> getUsuarios() async {
  final response = await client.get(request + 'usuarios/getall');

  final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

  return parsed.map<Usuario>((json) => Usuario.fromJson(json)).toList();
}

Future<Usuario> postUsuario(String controller, Map<String, String> post) async {
  var response = await http.post(request + controller, body: post);

  print(json.decode(response.body));
  return json.decode(response.body);
}
