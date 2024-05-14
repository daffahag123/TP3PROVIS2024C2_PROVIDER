import 'dart:convert';
import "package:http/http.dart" as http;
import "../models/mahasiswa.dart";

class MahasiswaService {
  static const String _baseUrl = "http://127.0.0.1:8000/daftar_mahasiswa";

  Future<List<Mahasiswa>> fetchMahasiswaList() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((item) => Mahasiswa.fromJson(item))
          .toList();
    } else {
      throw Exception("gagal load foto");
    }
  }
}
