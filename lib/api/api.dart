import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi{
  final String _url = 'http://localhost:8000/api';

  postData(data, apiUrl) async {
    var fullUrl = _url +'/' + apiUrl;

    return await http.post(
      Uri(path: fullUrl),
      body: jsonEncode(data),
      headers: setHeaders()
    );
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;

    return await http.get(
      Uri(path: fullUrl),
      headers: setHeaders(),
    );
  }


  setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
}