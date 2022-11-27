import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getxtest/pages/auth/auth_screen.dart';

import 'pages/people.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/people',
          page: () => PeopleScreen(),
        ),
      ],
      home: AuthScreen(),
    );
  }
}
