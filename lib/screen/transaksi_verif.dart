import 'package:admin_samket/model/repository_transaksi.dart';
import 'package:admin_samket/model/transaksi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'dart:convert';

import 'package:admin_samket/constant.dart';
import 'package:http/http.dart' as http;

class TransaksiVerif extends StatefulWidget {
  const TransaksiVerif({super.key});

  @override
  State<TransaksiVerif> createState() => _TransaksiVerifState();
}

class _TransaksiVerifState extends State<TransaksiVerif> {
  List<Transaksi> listTransaksi = [];
  RepositoryTransaksi repository = RepositoryTransaksi();

  getData() async {
    listTransaksi = await repository.getVerif();
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
          itemCount: listTransaksi.length,
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
                            const Text('Id Transaksi: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listTransaksi[index].id.toString()),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Users id: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listTransaksi[index].users_id),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Tanggal: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listTransaksi[index].tanggal),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('nomor Hp: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listTransaksi[index].nomor),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Jenis: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listTransaksi[index].jenis),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Status: '),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Text(listTransaksi[index].status),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                var id = listTransaksi[index].id;
                                try {
                                  final response = await http.post(
                                    Uri.parse('$url/transaksi/selesai/$id'),
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
