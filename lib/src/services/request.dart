import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

const request = 'http://5b36568e.ngrok.io/api/';

Future<Map> getData(String controller, String token) async {
  http.Response response = await http.get(request+controller,
      headers: {HttpHeaders.authorizationHeader: token}
);
   print( json.decode(response.body));
   return json.decode(response.body);
}

Future<Map> postData(String controller, Map<String,String> post) async {
 
  var response = await http.post(request+controller, body: post);

     
    print (json.decode(response.body));
       return json.decode(response.body);

}
