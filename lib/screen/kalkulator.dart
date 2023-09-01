
import 'package:admin_samket/constant.dart';
import 'package:admin_samket/model/barang_model.dart';
import 'package:admin_samket/model/repository_barang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:collection/collection.dart';

class MyKalkulator extends StatefulWidget {
  const MyKalkulator({super.key});

  @override
  State<MyKalkulator> createState() => _MyKalkulatorState();
}

class _MyKalkulatorState extends State<MyKalkulator> {
  List<TextEditingController>? _controllers = [];
  List<int>? total = [];
  List<Barang> listBarang = [];
  String totalharga2 = '';
  String initialharga = '0';

  Repository repository = Repository();

  getData() async {
    listBarang = await repository.getData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Kalkulator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: ScreenUtil().setSp(15),
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: listBarang.length,
          itemBuilder: (context, index) {
            _controllers?.add(TextEditingController());
            total?.add(0);
            return Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: Container(
                // height: ScreenUtil().setHeight(80),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listBarang[index].nama.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rp. ${listBarang[index].harga.toString()}',
                          style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Berat"),
                            Container(
                              height: 100,
                              width: 100,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: _controllers![index],
                                // controller: _controllers!(TextEditingController()),
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  var berat =
                                      double.parse(_controllers![index].text);
                                  var barang2 =
                                      int.parse(listBarang[index].harga);
                                  var total2 = barang2 * berat;
                                  
                                  
                                  print(barang2);
                                  print(berat);
                                  total2;
                                  
                                  print('dipencet');
                                  setState(() {
                                    // total?.add(total2.toInt());
                                    total![index] = total2.toInt();
                                    var totalHarga = total!.sum;
                                    print(total);
                                    print(listBarang[index].harga);
                                    // print(_controllers[]);
                                    totalHarga;
                                    totalharga2 = totalHarga.toString();
                                  });
                                },
                                child: Text('selesai'))
                          ],
                        ),
                      ),
                    ),
                    Text(total![index].toString() ?? '0'),

                    // listSaldo?.total.toString() ?? '0',
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
         onPressed: () {
                    showDialog(
                        context: context,
                        builder: ((context) =>
                            _buildPopupDialog(context, total, listBarang)));
                  },
        child: Text(totalharga2.toString()),
      ),
    );
  }
}


Widget _buildPopupDialog(BuildContext context, total, listBarang) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
              child: Text(
            total.toString(),
            style: TextStyle(fontSize: ScreenUtil().setSp(20)),
            textAlign: TextAlign.center,
          )),
          SizedBox(height: ScreenUtil().setHeight(5),),
          // Center(
          //   child: SizedBox(
          //       height: ScreenUtil().setHeight(300),
          //       child:
          //           Image(image: NetworkImage('$url2/storage/${barang.foto}'),fit: BoxFit.cover,)),
          // ),
          // SizedBox(height: ScreenUtil().setHeight(5),),
          // Center(
          //     child: Text(
          //   'Rp. ${barang.harga.toString()}',
          //   style: TextStyle(fontSize: ScreenUtil().setSp(20)),
          //   textAlign: TextAlign.center,
          // ))
        ],
      ),
    );
  }
