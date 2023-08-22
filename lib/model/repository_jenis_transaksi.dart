import 'dart:convert';

import 'package:admin_samket/constant.dart';
import 'package:admin_samket/model/jenis_transaksi_model.dart';

import 'package:http/http.dart' as http;

class RepositoryJenisTransaksi {
  final _baseurl = '$url/jenis-transaksi';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseurl));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<JenisTransaksi> barang =
            it.map((e) => JenisTransaksi.fromJson(e)).toList();
        return barang;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future getDetail(String id) async {
    try {
      final response = await http.get(Uri.parse('$url/jenis-transaksis'));
      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);
        Iterable it = jsonDecode(response.body);
        List<JenisTransaksi> barang =
            it.map((e) => JenisTransaksi.fromJson(e)).toList();
        return barang;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  Future updateJenis(String nama, String id) async {
    try {
      final response =
          await http.post(Uri.parse('$url/jenis-transaksi/update/$id'), body: {
        'nama': nama,
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

  Future postJenis(
    String nama,
  ) async {
    try {
      final response =
          await http.post(Uri.parse('$url/jenis-transaksi'), body: {
        'nama': nama,
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
