import 'package:admin_samket/model/repository_transaksi.dart';
import 'package:admin_samket/model/transaksi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransaksiSelesai extends StatefulWidget {
  const TransaksiSelesai({super.key});

  @override
  State<TransaksiSelesai> createState() => _TransaksiSelesaiState();
}

class _TransaksiSelesaiState extends State<TransaksiSelesai> {
  List<Transaksi> listTransaksi = [];
  RepositoryTransaksi repository = RepositoryTransaksi();

  getData() async {
    listTransaksi = await repository.getSelesai();
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
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
