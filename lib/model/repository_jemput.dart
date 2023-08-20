import 'dart:convert';

import 'package:admin_samket/constant.dart';
import 'package:admin_samket/model/jemput_model.dart';

import 'package:http/http.dart' as http;

class RepositoryJemput {
  final _nunggu = '$url/pesan/nunggu';
  final _admin = '$url/pesan/admin';
  final _selesai = '$url/pesan/selesai';

  Future getnunggu() async {
    try {
      final response = await http.get(Uri.parse(_nunggu));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Jemput> barang = it.map((e) => Jemput.fromJson(e)).toList();
        return barang;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future getAdmin() async {
    try {
      final response = await http.get(Uri.parse(_admin));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Jemput> barang = it.map((e) => Jemput.fromJson(e)).toList();
        return barang;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future getSelesai() async {
    try {
      final response = await http.get(Uri.parse(_selesai));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Jemput> barang = it.map((e) => Jemput.fromJson(e)).toList();
        return barang;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
