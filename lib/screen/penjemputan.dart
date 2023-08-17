import 'package:admin_samket/screen/jemput_jadwal.dart';
import 'package:admin_samket/screen/jemput_selesai.dart';
import 'package:admin_samket/screen/jemput_verif.dart';
import 'package:flutter/material.dart';

class PenjemputanScreen extends StatefulWidget {
  const PenjemputanScreen({super.key});

  @override
  State<PenjemputanScreen> createState() => _PenjemputanScreenState();
}

class _PenjemputanScreenState extends State<PenjemputanScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: const Text('Penjemputan'),
              centerTitle: true,
              pinned: true,
              floating: true,
              bottom: TabBar(
                indicator: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(20)),
                tabs: const [
                  Tab(child: Text('Verifikasi Admin',textAlign: TextAlign.center,)),
                  Tab(child: Text('Jadwal Penjemputan',textAlign: TextAlign.center,)),
                  Tab(
                    child: Text('Selesai',textAlign: TextAlign.center,),
                  )
                ],
              ),
            ),
          ];
        },
        body: const TabBarView(
          children: <Widget>[
            NungguAdmin(),
            NungguJadwal(),
            JemputSelesai(),
          ],
        ),
      )),
    );
  }
}
