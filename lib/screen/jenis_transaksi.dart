import 'dart:convert';

import 'package:admin_samket/constant.dart';
import 'package:admin_samket/model/jenis_transaksi_model.dart';
import 'package:admin_samket/model/repository_jenis_transaksi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:admin_samket/model/jenis_transaksi_model.dart';

import 'package:http/http.dart' as http;

class JenisTransaksiScreen extends StatefulWidget {
  const JenisTransaksiScreen({super.key});

  @override
  State<JenisTransaksiScreen> createState() => _JenisTransaksiScreenState();
}

class _JenisTransaksiScreenState extends State<JenisTransaksiScreen> {
  List<JenisTransaksi> listJenisTransaksi = [];
  RepositoryJenisTransaksi repository = RepositoryJenisTransaksi();

  getData() async {
    listJenisTransaksi = await repository.getData();
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
      appBar: AppBar(
        title: Text("Jenis Transaksi"),
      ),
      body: ListView.builder(
          itemCount: listJenisTransaksi.length,
          itemBuilder: (context, index) {
            var list = listJenisTransaksi[index];
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((context) => _buildPopupDialog(context, list)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                listJenisTransaksi[index].id.toString(),
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(5),
                              ),
                              Text(listJenisTransaksi[index].nama),
                            ],
                          )),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  var id = listJenisTransaksi[index].id;
                                  _showAlertDialog2(context, id);
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () async {
                                  var id = listJenisTransaksi[index].id;
                                  try {
                                    final response = await http.post(
                                      Uri.parse(
                                          '$url/jenis-transaksi/delete/$id'),
                                    );

                                    if (response.statusCode == 200) {
                                      var jsonReponse =
                                          json.decode(response.body);

                                      return _showAlertDialogBerhasil2(context);
                                    } else {
                                      return _showAlertDialogGagal2(context);
                                    }
                                  } catch (e) {
                                    print(e.toString());
                                  }
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _showAlertDialog(context);
        },
      ),
    );
  }
}

_showAlertDialog(BuildContext context) {
  RepositoryJenisTransaksi repository = RepositoryJenisTransaksi();
  final _namaControler = TextEditingController();

  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () async {
      bool response = await repository.postJenis(_namaControler.text);
      if (response) {
        _showAlertDialogBerhasil(context);
      } else {
        _showAlertDialogGagal(context);
      }
    },
  );

  // set up the AlertDialog

  AlertDialog alert = AlertDialog(
    title: const Text("Input Nama"),
    content: SizedBox(
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setWidth(300),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
            child: TextFormField(
              controller: _namaControler,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.add_task,
                    color: Colors.black,
                  ),
                  hintText: 'Judul Pertanyaan',
                  labelText: 'Judul',
                  labelStyle: TextStyle(color: Colors.black),
                  focusColor: Colors.black),
            ),
          ),
        ],
      ),
    ),
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

_showAlertDialog2(BuildContext context, id) {
  RepositoryJenisTransaksi repository = RepositoryJenisTransaksi();
  final _namaController = TextEditingController();

  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () async {
      bool response =
          await repository.updateJenis(_namaController.text, id.toString());
      if (response) {
        _showAlertDialogBerhasil(context);
      } else {
        _showAlertDialogGagal(context);
      }
    },
  );

  // set up the AlertDialog

  AlertDialog alert = AlertDialog(
    title: const Text("Input Pertanyaan"),
    content: SizedBox(
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setWidth(300),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
            child: TextFormField(
              controller: _namaController,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.add_task,
                    color: Colors.black,
                  ),
                  hintText: 'Judul Pertanyaan',
                  labelText: 'Judul',
                  labelStyle: TextStyle(color: Colors.black),
                  focusColor: Colors.black),
            ),
          ),
        ],
      ),
    ),
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
        )),
      ],
    ),
  );
}

_showAlertDialogBerhasil(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const JenisTransaksiScreen();
      }));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Bantuan berhasil ditambahkan"),
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

_showAlertDialogGagal(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const JenisTransaksiScreen();
      }));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Bantuan gagal ditambahkan"),
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

_showAlertDialogBerhasil2(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const JenisTransaksiScreen();
      }));
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Bantuan berhasil dihapus"),
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
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const JenisTransaksiScreen();
      }));
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
