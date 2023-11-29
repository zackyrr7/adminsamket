class Pengguna {
  int id;
  String name;
  String no_hp;
  String role;

  Pengguna(
      {required this.id,
      required this.role,
      required this.name,
      required this.no_hp});

  factory Pengguna.fromJson(Map<String, dynamic> json) {
    return Pengguna(
      id: json['id'],
      role: json['role'],
      name: json['name'],
      no_hp: json['no_hp'],
    );
  }
}
