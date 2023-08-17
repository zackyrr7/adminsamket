// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:admin_samket/model/pertanyaan_model.dart';
import 'package:admin_samket/model/repository_pertanyaan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: ((context) => _showAlertDialog(
                            context,
                          )));
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(listPertanyaan[index].judul)),
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
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  final _judulController = TextEditingController();
  final _jawabanController = TextEditingController();
  AlertDialog alert = AlertDialog(
    title: const Text("Terjadi Kesalahan"),
    content: SizedBox(
      height: ScreenUtil().setHeight(125),
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
