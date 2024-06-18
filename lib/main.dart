import 'package:flutter/material.dart';
import 'pages/initial_setup_page.dart';
import 'pages/dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '禁煙記録アプリ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InitialSetupPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
