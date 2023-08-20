// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, avoid_unnecessary_containers, use_build_context_synchronously, avoid_print

import 'package:admin_samket/constant.dart';
import 'package:admin_samket/model/pertanyaan_model.dart';
import 'package:admin_samket/model/repository_bantuan.dart';
import 'package:admin_samket/model/repository_pertanyaan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class Bantuan extends StatefulWidget {
  const Bantuan({super.key});

  @override
  State<Bantuan> createState() => _BantuanState();
}

class _BantuanState extends State<Bantuan> {
  List<Pertanyaan> listPertanyaan = [];
  RepositoryPertanyaan repository = RepositoryPertanyaan();

  getData() async {
    listPertanyaan = await repository.getData();
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
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Pertanyaan yang sering ditanyakan",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(15),
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: listPertanyaan.length,
          itemBuilder: (context, index) {
            var pertanyaan = listPertanyaan[index];
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((context) =>
                          _buildPopupDialog(context, pertanyaan)));
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
                          child: Text(listPertanyaan[index].judul)),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  var id = listPertanyaan[index].id;
                                  _showAlertDialog2(context, id);
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () async {
                                  var id = listPertanyaan[index].id;
                                  try {
                                    final response = await http.post(
                                      Uri.parse('$url/pertanyaan/delete/$id'),
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
  RepositoryBantuan repository = RepositoryBantuan();
  final _judulController = TextEditingController();
  final _jawabanController = TextEditingController();
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () async {
      bool response = await repository.postBantuan(
          _judulController.text, _jawabanController.text);
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
              controller: _judulController,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
            child: TextFormField(
              controller: _jawabanController,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'Jawaban pertanyaan',
                  labelText: 'Jawaban',
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
  RepositoryBantuan repository = RepositoryBantuan();
  final _judulController = TextEditingController();
  final _jawabanController = TextEditingController();

  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () async {
      bool response = await repository.updateBantuan(
          _judulController.text, _jawabanController.text, id.toString());
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
              controller: _judulController,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
            child: TextFormField(
              controller: _jawabanController,
              decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'Jawaban pertanyaan',
                  labelText: 'Jawaban',
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
        return const Bantuan();
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
        return const Bantuan();
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
        return const Bantuan();
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
        return const Bantuan();
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
