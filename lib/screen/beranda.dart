// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:admin_samket/screen/bantuan.dart';
import 'package:admin_samket/screen/barang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(100),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setHeight(100),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Jumlah Pengguna",
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "100",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setHeight(100),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Jumlah Transaksi",
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "100",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setHeight(100),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Jumlah Penjemputan",
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "100",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ScreenBarang();
                  }));
                },
                child: Container(
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(340),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.badge),
                        SizedBox(
                          width: ScreenUtil().setWidth(5),
                        ),
                        Text(
                          'Barang',
                          style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Bantuan();
                  }));
                },
                child: Container(
                  height: ScreenUtil().setHeight(50),
                  width: ScreenUtil().setWidth(340),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.badge),
                        SizedBox(
                          width: ScreenUtil().setWidth(5),
                        ),
                        Text(
                          'Bantuan',
                          style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
