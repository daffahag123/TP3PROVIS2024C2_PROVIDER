import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3_provider/services/mahasiswa_service.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MahasiswaProvider(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
