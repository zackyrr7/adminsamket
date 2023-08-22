// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:admin_samket/model/jemput_model.dart';
import 'package:admin_samket/screen/bantuan.dart';
import 'package:admin_samket/screen/barang.dart';
import 'package:admin_samket/screen/jenis_transaksi.dart';
import 'package:admin_samket/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  String id = '';

  _loadid() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      id = (sharedPreferences.getString('id') ?? '');
      print(id);
    });
  }

  late SharedPreferences sharedPreferences;
  String user2 = '0';
  String pesan2 = '0';
  String transaksi2 = '0';
  void total() async {
    SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();
    var user = sharedPreferences.getString("user".toString());

    var pesan = sharedPreferences.getString("pesan".toString());
    var transaksi = sharedPreferences.getString("transaksi".toString());
    setState(() {
      user2 = user.toString();
      pesan2 = pesan.toString();
      transaksi2 = transaksi.toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    total();
    _loadid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              sharedPreferences.clear();
              //sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (BuildContext context) => const LoginScreen()),
                  (Route<dynamic> route) => false);
            },
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                "Keluar",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            )),
          )
        ],
        title: const Text("Admin Sampah Market"),
      ),
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
                            user2,
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
                            transaksi2,
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
                            pesan2,
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const JenisTransaksiScreen();
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
                          'Jenis Transaksi',
                          style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
