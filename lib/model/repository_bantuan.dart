// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:admin_samket/constant.dart';
import 'package:http/http.dart' as http;

class RepositoryBantuan {
  Future postBantuan(
    String judul,
    String jawaban,
  ) async {
    try {
      final response = await http.post(Uri.parse('$url/pertanyaan'), body: {
        'judul': judul,
        'jawaban': jawaban,
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

  Future updateBantuan(
    String judul,
    String jawaban,
    String id,
  ) async {
    try {
      final response =
          await http.post(Uri.parse('$url/pertanyaan/update/$id'), body: {
        'judul': judul,
        'jawaban': jawaban,
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
