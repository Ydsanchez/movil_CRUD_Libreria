import 'package:flutter/material.dart';
import 'package:taller_login/ui/interfaces/loginUsuario.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crud Libro',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const LoginUsuario(),
      debugShowCheckedModeBanner: false,
    );
  }
}