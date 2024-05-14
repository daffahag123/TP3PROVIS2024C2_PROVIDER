import 'dart:convert';
import "package:http/http.dart" as http;
import "../models/mahasiswa.dart";
import 'package:flutter/material.dart';

class MahasiswaProvider with ChangeNotifier {
  String url = "http://127.0.0.1:8000/daftar_mahasiswa";
  List<MahasiswaModel> _mahasiswaList = [];

  List<MahasiswaModel> get mahasiswaList => _mahasiswaList;

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body)['data'];
      _mahasiswaList = data.map((e) => MahasiswaModel.fromJson(e)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
