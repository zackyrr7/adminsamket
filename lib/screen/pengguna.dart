import 'package:admin_samket/constant.dart';
import 'package:admin_samket/model/penggunda_model.dart';
import 'package:admin_samket/model/repository_pengguna.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PenggunaScreen extends StatefulWidget {
  const PenggunaScreen({super.key});

  @override
  State<PenggunaScreen> createState() => _PenggunaScreenState();
}

class _PenggunaScreenState extends State<PenggunaScreen> {
  List<Pengguna> ListPengguna = [];
  RepositoryPengguna repository = RepositoryPengguna();

  getData() async {
    ListPengguna = await repository.getData();
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
          "Jumlah Pengguna",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(15),
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: ListPengguna.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: GestureDetector(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(ListPengguna[index].id.toString()),
                                  Container(
                                      // color: biruMain,
                                      width: ScreenUtil().setWidth(150),
                                      child: Center(
                                        child: Text(
                                          ListPengguna[index].name,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(12)),
                                        ),
                                      )),
                                  Text(ListPengguna[index].no_hp),
                                  Text(ListPengguna[index].role),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      var id = ListPengguna[index].id;
                                      var nama = ListPengguna[index].name;
                                      _showAlertDialog2(context, id,nama);
                                    },
                                    icon: Icon(Icons.add),
                                    label: Text('Tabungan'),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

_showAlertDialog2(BuildContext context, id,nama) {
  RepositoryPengguna repository = RepositoryPengguna();

  final _saldo = TextEditingController();

  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () async {
      bool response = await repository.postTabungan(id.toString(), _saldo.text);
      if (response) {
        _showAlertDialogBerhasil(context);
      } else {
        _showAlertDialogGagal(context);
      }
    },
  );

  // set up the AlertDialog

  AlertDialog alert = AlertDialog(
    title: const Text("Input Tabugan"),
    content: SizedBox(
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setWidth(300),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 10),
            child: TextFormField(
              controller: _saldo,
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

_showAlertDialogBerhasil(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const PenggunaScreen();
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
        return const PenggunaScreen();
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
