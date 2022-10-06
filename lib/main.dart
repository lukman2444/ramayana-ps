import 'package:flutter/material.dart';

import 'package:materi/login.dart';
//import 'package:materi/stack_tugas.dart';
//import 'package:materi/berita.dart';
// import 'package:materi/ramayana.dart';
//import 'package:materi/ramayana1.dart';
//import 'package:materi/ramayana2.dart';
//import 'package:materi/profile1.dart';
import 'package:materi/login.dart';
import 'package:materi/ramayana.dart';
import 'package:responsive_framework/responsive_framework.dart';
// import 'package:materi/new.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
              child,
              maxWidth: 1200,
              minWidth: 480,
              defaultScale: true,
              breakpoints: [ResponsiveBreakpoint.autoScale(600)],
            ),
        title: 'Data Karyawan',
        debugShowCheckedModeBanner: false,
        home: LoginActivity());
  }
}
