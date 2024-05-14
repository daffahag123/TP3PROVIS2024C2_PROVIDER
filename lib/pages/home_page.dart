import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp3_provider/services/mahasiswa_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar Mahasiswa',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Selamat datang di Halaman Daftar Mahasiswa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<MahasiswaProvider>().fetchData();
                },
                child: Text('Tampilkan Daftar Mahasiswa'),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Consumer<MahasiswaProvider>(
                  builder: (context, provider, child) {
                    if (provider.mahasiswaList.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: provider.mahasiswaList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          child: InkWell(
                            onTap: () {
                              // Implement navigation to detail page if needed
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 12),
                                Expanded(
                                  child: Image.network(
                                    'https://cdn.icon-icons.com/icons2/1879/PNG/512/iconfinder-3-avatar-2754579_120516.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  provider.mahasiswaList[index].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(provider.mahasiswaList[index].nim),
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
