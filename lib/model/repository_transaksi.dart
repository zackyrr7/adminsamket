import 'dart:convert';

import 'package:admin_samket/constant.dart';

import 'package:admin_samket/model/transaksi_model.dart';
import 'package:http/http.dart' as http;

class RepositoryTransaksi {
  final _verif = '$url/transaksi/verif';
  final _selesai = '$url/transaksi/selesai';

  Future getVerif() async {
    try {
      final response = await http.get(Uri.parse(_verif));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<Transaksi> transaksi =
            it.map((e) => Transaksi.fromJson(e)).toList();
        return transaksi;
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
        List<Transaksi> transaksi =
            it.map((e) => Transaksi.fromJson(e)).toList();
        return transaksi;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }
}
