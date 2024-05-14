import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mahasiswa.dart';
import 'package:flutter/material.dart';

class MahasiswaProvider with ChangeNotifier {
  String url = "http://127.0.0.1:8000/detil_mahasiswa/";
  MahasiswaModel? _mahasiswa;
  MahasiswaModel? get mahasiswa => _mahasiswa;

  Future<void> fetchData(String id) async {
    final response = await http.get(Uri.parse('$url$id'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      _mahasiswa = MahasiswaModel.fromJson(data); 
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
