import 'package:admin_samket/screen/transaksi_selesai.dart';
import 'package:admin_samket/screen/transaksi_verif.dart';
import 'package:flutter/material.dart';

class PenukaranSaldoScren extends StatefulWidget {
  const PenukaranSaldoScren({super.key});

  @override
  State<PenukaranSaldoScren> createState() => _PenukaranSaldoScrenState();
}

class _PenukaranSaldoScrenState extends State<PenukaranSaldoScren> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Transaksi'),
              centerTitle: true,
              pinned: true,
              floating: true,
              bottom: TabBar(
                indicator: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20)),
                tabs: const [
                  Tab(
                      child: Text(
                    'Verifikasi Admin',
                    textAlign: TextAlign.center,
                  )),
                  Tab(
                    child: Text(
                      'Selesai',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ];
        },
        body: const TabBarView(
          children: <Widget>[TransaksiVerif(), TransaksiSelesai()],
        ),
      )),
    );
  }
}
