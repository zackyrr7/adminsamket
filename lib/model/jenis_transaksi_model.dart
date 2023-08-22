class JenisTransaksi {
  final String nama;
  final int id;

  JenisTransaksi({required this.nama, required this.id});

  factory JenisTransaksi.fromJson(Map<String, dynamic> json) {
    return JenisTransaksi(
      id: json['id'],
      nama: json['nama'],
    );
  }
}
