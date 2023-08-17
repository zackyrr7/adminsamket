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
