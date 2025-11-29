import 'package:flutter/material.dart';

import 'package:srevice_link/pages/start_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My APP",
      home: StartPage(),
    );
  }
}
