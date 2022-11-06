import 'package:flutter/material.dart';
import 'package:flutter_crud_http_api/screens/homeScreen.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD Using HTTP Api',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // primaryColor: Colors.orange[100], // mot working
        // colorScheme: const ColorScheme.light().copyWith(primary: Colors.red),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.orangeAccent,
          elevation: 10,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
