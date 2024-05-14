class MahasiswaModel {
  String id;
  String name;
  String nim;
  String jenis_kelamin;
  String umur;
  String asal_kota;

  MahasiswaModel({
    required this.id,
    required this.name,
    required this.nim,
    required this.jenis_kelamin,
    required this.umur,
    required this.asal_kota,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      id: json['id'],
      name: json['name'],
      nim: json['nim'],
      jenis_kelamin: json['jenis_kelamin'],
      umur: json['umur'],
      asal_kota: json['asal_kota'],
    );
  }
}
