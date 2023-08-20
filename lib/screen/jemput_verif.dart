// ignore_for_file: avoid_print, use_build_context_synchronously, unused_element

import 'package:admin_samket/model/jemput_model.dart';
import 'package:admin_samket/model/repository_jemput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';

import 'package:admin_samket/constant.dart';
import 'package:http/http.dart' as http;

class NungguAdmin extends StatefulWidget {
  const NungguAdmin({super.key});

  @override
  State<NungguAdmin> createState() => _NungguAdminState();
}

class _NungguAdminState extends State<NungguAdmin> {
  List<Jemput> listJemput = [];
  RepositoryJemput repository = RepositoryJemput();

  getData() async {
    listJemput = await repository.getAdmin();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: listJemput.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Text('Id Pesanan: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listJemput[index].id.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Users id: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listJemput[index].users_id),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Tanggal: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listJemput[index].tanggal),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('alamat: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listJemput[index].alamat),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Status: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listJemput[index].status),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                var id = listJemput[index].id;
                                try {
                                  final response = await http.post(
                                    Uri.parse('$url/pesan/nunggu/$id'),
                                  );

                                  if (response.statusCode == 200) {
                                    var jsonReponse =
                                        json.decode(response.body);
                                    print(jsonReponse);

                                    return _showAlertDialogBerhasil2(context);
                                  } else {
                                    return _showAlertDialogGagal2(context);
                                  }
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                              child: const Text('Verifikasi')),
                        )
                      ],
                    )),
              ),
            );
          }),
    );
  }
}

Widget _buildPopupDialog(BuildContext context, pertanyaan) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
            child: Text(
          pertanyaan.judul,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
        SizedBox(
          height: ScreenUtil().setHeight(20),
        ),
        Center(
            child: Text(
          pertanyaan.jawaban,
          style: TextStyle(fontSize: ScreenUtil().setSp(15)),
          textAlign: TextAlign.justify,
        ))
      ],
    ),
  );
}

_showAlertDialogBerhasil2(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Berhasil di verifikasi"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

_showAlertDialogGagal2(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Bantuan gagal dihapus"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
