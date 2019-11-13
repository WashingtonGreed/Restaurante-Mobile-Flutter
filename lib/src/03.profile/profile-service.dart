import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:restaurantemobileflutter/src/models/Usuario.dart';

const request = 'http://367c47d2.ngrok.io/api/';

Future<Map> getData(String controller, String token) async {
  http.Response response = await http.get(request+controller,
      headers: {HttpHeaders.authorizationHeader: token}
);
   print( json.decode(response.body));
   return json.decode(response.body);
}

Future<Usuario> postData(String controller, Map<String,String> post) async {
 
  var response = await http.post('http://367c47d2.ngrok.io/api/'+controller, body: post);

     
    print (json.decode(response.body));
       return json.decode(response.body);

}
