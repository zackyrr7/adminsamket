import 'dart:convert';

import 'package:admin_samket/constant.dart';
import 'package:admin_samket/model/penggunda_model.dart';
import 'package:http/http.dart' as http;

class RepositoryPengguna {
  final _baseurl = '$url/user/all';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseurl));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Pengguna> pengguna = it.map((e) => Pengguna.fromJson(e)).toList();
        return pengguna;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future postTabungan(
    String users_id,
    String saldo,
  ) async {
    try {
      final response = await http.post(Uri.parse('$url/tabungan'), body: {
        'users_id': users_id,
        'saldo': saldo,
      });

      if (response.statusCode == 200) {
        // ignore: unused_local_variable
        var jsonReponse = json.decode(response.body);

        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
