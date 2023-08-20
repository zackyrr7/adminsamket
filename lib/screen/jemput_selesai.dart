import 'package:admin_samket/model/jemput_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/repository_jemput.dart';

class JemputSelesai extends StatefulWidget {
  const JemputSelesai({super.key});

  @override
  State<JemputSelesai> createState() => _JemputSelesaiState();
}

class _JemputSelesaiState extends State<JemputSelesai>
    with SingleTickerProviderStateMixin {
  List<Jemput> listJemput = [];
  RepositoryJemput repository = RepositoryJemput();

  getData() async {
    listJemput = await repository.getSelesai();
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
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
