import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TotalScreen extends StatefulWidget {
  final List nama;
  final List hargaTotal;
  final List beratTotal;
  final String totalHarga2;
  final String namaPembeli;

  TotalScreen(
      {super.key,
      required this.nama,
      required this.namaPembeli,
      required this.totalHarga2,
      required this.hargaTotal,
      required this.beratTotal});

  @override
  State<TotalScreen> createState() => _TotalScreenState();
}

class _TotalScreenState extends State<TotalScreen> {
  final tanggal = new DateTime.now();
  // String tanggal2 = tanggal.toString();
  late String formatter = DateFormat('yMd').format(tanggal); // 28/03/2020
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tanggal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: ScreenUtil().setHeight(80),
                    width: ScreenUtil().setWidth(80),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: const Image(
                        image: AssetImage("assets/images/logo2.png"))),
                Container(
                  child: Column(children: [
                    Text("Nota Penjualan"),
                    Text(formatter.toString()),
                    Text(widget.namaPembeli)
                  ]),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.nama.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Text(widget.nama[index]),
                      Text(widget.hargaTotal[index].toString()),
                      Text(widget.beratTotal[index].toString()),
                    ],
                  );
                }),
          ),
        ],
      ),
    ));
  }
}
