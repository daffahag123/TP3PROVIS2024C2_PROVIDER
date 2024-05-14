import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3_provider/providers/daftar_mahasiswa_provider.dart';
import 'package:tp3_provider/providers/mahasiswa_provider.dart';
import 'package:tp3_provider/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MahasiswaProvider()),
        ChangeNotifierProvider(create: (_) => MahasiswaListProvider()),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
