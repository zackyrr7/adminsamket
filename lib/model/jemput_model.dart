// ignore_for_file: non_constant_identifier_names

class Jemput {
  final String users_id;
  final int id;
  final String tanggal;
  final String alamat;
  final String jenis;
  final String status;

  Jemput(
      {required this.users_id,
      required this.id,
      required this.tanggal,
      required this.alamat,
      required this.jenis,
      required this.status});

  factory Jemput.fromJson(Map<String, dynamic> json) {
    return Jemput(
        users_id: json['users_id'],
        id: json['id'],
        tanggal: json['tanggal'],
        alamat: json['alamat'],
        jenis: json['jenis'],
        status: json['status']);
  }
}
