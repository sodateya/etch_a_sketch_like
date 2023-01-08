import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //これ入れないとダメだったと思います。
  await SystemChrome.setPreferredOrientations([
//許可する向きを指定する。
    //下向きを許可
    DeviceOrientation.landscapeLeft, //左向きを許可
    DeviceOrientation.landscapeRight, //右向きを許可
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
