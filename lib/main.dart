import 'package:admin_samket/screen/login_screen.dart';
import 'package:admin_samket/theme.dart';
import 'package:admin_samket/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String id = '';
  _loadid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString('id') ?? '');
      // ignore: avoid_print
      print(id);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadid();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        if (id == '') {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Admin Sampah Market",
            //defaul size = 360,690
            theme: buildThemeData(),
            home: const LoginScreen(),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Admin Sampah Market",
            theme: buildThemeData(),
            home: const Navbar(),
          );
        }
      },
    );
  }
}
