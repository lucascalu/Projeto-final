import 'package:flutter/material.dart';
import 'package:projeto_final/Views/primary_page.dart';


void main() {
  runApp(MaterialApp(
    home: PrimaryPage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.red),
  ));
}
