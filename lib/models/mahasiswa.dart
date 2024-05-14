class Mahasiswa {
  final String id;
  final String name;
  final String nim;
  final String jenis_kelamin;
  final String umur;
  final String asal_kota;

  Mahasiswa(
      {required this.id,
      required this.name,
      required this.nim,
      required this.jenis_kelamin,
      required this.umur,
      required this.asal_kota,});

  factory Mahasiswa.fromJson(Map<String, dynamic> json) {
    return Mahasiswa(
      id: json["id"],
      name: json["name"],
      nim: json["nim"],
      jenis_kelamin: json["jenis_kelamin"],
      umur: json["umur"],
      asal_kota: json["asal_kota"],
    );
  }
}
