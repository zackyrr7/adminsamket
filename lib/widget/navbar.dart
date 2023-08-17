import 'package:admin_samket/constant.dart';
import 'package:admin_samket/screen/beranda.dart';
import 'package:admin_samket/screen/penjemputan.dart';
import 'package:admin_samket/screen/penukaran_saldo.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const Beranda(),
    const PenjemputanScreen(),
    const PenukaranSaldoScren(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: biruMain,
        unselectedItemColor: Colors.grey,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), label: 'Penjemputan'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Transaksi'),
        ],
      ),
    );
  }
}
