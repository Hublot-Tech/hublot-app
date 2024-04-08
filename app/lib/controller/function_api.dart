import 'package:http/http.dart' as http;
//function qui envoie l'idToken de google a l'api

Future<void> postIdToken(String idToken) async {
  Map<String, String> request = {"id": idToken};
  final uri = Uri.parse('');
  final response = await http.post(uri, body: request);
  if (response.statusCode == 200) {
    //idTokend send:
  } else {
    throw Exception('Fail to load post');
  }
}
