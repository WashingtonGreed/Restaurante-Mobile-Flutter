import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:async';

import 'package:restaurantemobileflutter/src/models/Usuario.dart';

const request = 'http://d25952c1.ngrok.io/api/';
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

Future<Usuario> postUsuario(String controller, Map<String, dynamic> post) async {
  var response = await http.post(request + controller, body: post).then((res) {
     print(res.statusCode);
   }).catchError((err) {
     print(err);
   });
  
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  var box = await Hive.openBox('TOKEN');

  box.put("TOKEN", Usuario.fromJson(json.decode(response.body)).token);
  box.put("ID", Usuario.fromJson(json.decode(response.body)).id);

  return response;
}
