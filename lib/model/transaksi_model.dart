// ignore_for_file: non_constant_identifier_names

class Transaksi {
  final int id;
  final String users_id;
  final String tanggal;
  final String nomor;
  final String jenis;
  final String status;

  Transaksi({
    required this.id,
    required this.users_id,
    required this.tanggal,
    required this.nomor,
    required this.jenis,
    required this.status,
  });

  factory Transaksi.fromJson(Map<String, dynamic> json) {
    return Transaksi(
        id: json['id'],
        users_id: json['users_id'],
        tanggal: json['tanggal'],
        nomor: json['nomor'],
        jenis: json['jenis'],
        status: json['status']);
  }
}
