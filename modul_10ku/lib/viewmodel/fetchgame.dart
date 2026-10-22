import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modul_10/model/game.dart';

Future<List<Game>> fetchGames() async {
  final respone = await http.get(
    Uri.parse('https://www.freetogame.com/api/games'),
  );

  if (respone.statusCode == 200) {
    final List<dynamic> jsonData = json.decode(respone.body);
    return jsonData.map((item) => Game.fromJson(item)).toList();
  } else {
    throw Exception('Gagal mengambil data game');
  }
}

Future<Map<String, dynamic>> fetchDataFromAPI(int idGame) async {
  final respone = await http.get(
    Uri.parse('https://www.freetogame.com/api/game?id=$idGame'),
  );
  if (respone.statusCode == 200) {
    final jsonData = json.decode(respone.body);
    if (jsonData != null && jsonData is Map<String, dynamic>) {
      return jsonData;
    } else {
      throw Exception('Data dari API tida sesuai dengan yang diharapkan');
    }
  } else {
    throw Exception('Gagal mengambil data dari API');
  }
}
