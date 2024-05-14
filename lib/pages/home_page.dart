import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import '../models/mahasiswa.dart';
import '../services/mahasiswa_service.dart';

import 'detail_page.dart';

// Define the MahasiswaProvider within the same file
class MahasiswaProvider with ChangeNotifier {
  final MahasiswaService _mahasiswaService = MahasiswaService();
  List<Mahasiswa> _mahasiswaList = [];
  bool _isLoading = true;

  List<Mahasiswa> get mahasiswaList => _mahasiswaList;
  bool get isLoading => _isLoading;

  MahasiswaProvider() {
    fetchMahasiswaList();
  }

  Future<void> fetchMahasiswaList() async {
    try {
      _mahasiswaList = await _mahasiswaService.fetchMahasiswaList();
    } catch (e) {
      print("Error fetching mahasiswa list: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

// HomePage widget
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MahasiswaProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Daftar Mahasiswa',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<MahasiswaProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Selamat datang di Halaman Daftar Mahasiswa',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: provider.fetchMahasiswaList,
                      child: Text('Tampilkan Daftar Mahasiswa'),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: MasonryView(
                        listOfItem: provider.mahasiswaList,
                        numberOfColumn: 2,
                        itemBuilder: (item) {
                          return _buildMahasiswaCard(context, item);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMahasiswaCard(BuildContext context, Mahasiswa mahasiswa) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // Assuming you have set up DetailMahasiswaPage properly
              return DetailMahasiswaPage(mahasiswaId: mahasiswa.id);
            }),
          );
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
              mahasiswa.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(mahasiswa.nim),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// Dummy DetailMahasiswaPage for navigation
class DetailMahasiswaPage extends StatelessWidget {
  final String mahasiswaId;

  DetailMahasiswaPage({required this.mahasiswaId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Mahasiswa'),
      ),
      body: Center(
        child: Text('Detail Mahasiswa with ID: $mahasiswaId'),
      ),
    );
  }
}
