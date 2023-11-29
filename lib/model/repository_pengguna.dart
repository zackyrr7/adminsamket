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
        List<Pengguna> pengguna =
            it.map((e) => Pengguna.fromJson(e)).toList();
        return pengguna;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}