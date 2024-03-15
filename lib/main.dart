import 'package:flutter/material.dart';
import 'View/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Model Example',
      home: ModelView(),
    );
  }
}
