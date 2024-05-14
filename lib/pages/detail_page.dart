import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/mahasiswa_provider.dart';

class DetailMahasiswaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Mahasiswa'),
        centerTitle: true,
      ),
      body: Consumer<MahasiswaProvider>(
        builder: (context, mahasiswaProvider, _) {
          final mahasiswaDetail = mahasiswaProvider.mahasiswa;

          return Stack(
            children: [
              Positioned.fill(
                child: Image(
                  image: NetworkImage(
                      'https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-3-avatar-2754579_120516.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                top: 400.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '${mahasiswaDetail?.name ?? ''}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Umur: ${mahasiswaDetail?.umur ?? ''}',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        "Jenis Kelamin: ${mahasiswaDetail?.jenis_kelamin ?? ''}",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'NIM: ${mahasiswaDetail?.nim ?? ''}',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        'Asal Kota: ${mahasiswaDetail?.asal_kota ?? ''}',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
