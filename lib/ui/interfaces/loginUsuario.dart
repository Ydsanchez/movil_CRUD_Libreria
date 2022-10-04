// ignore_for_file: non_constant_identifier_names

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:taller_login/domain/modelo/persona.dart';
import 'package:taller_login/ui/interfaces/listarLibros.dart';
import 'package:taller_login/ui/interfaces/registroUsuario.dart';
import 'package:taller_login/ui/interfaces/widgets.dart';

class LoginUsuario extends StatefulWidget {
  const LoginUsuario({super.key});

  @override
  State<LoginUsuario> createState() => _LoginUsuarioState();
}

class _LoginUsuarioState extends State<LoginUsuario> {
  final List<Persona> _persona = listaPersona;

  TextEditingController controlCorreo = TextEditingController();
  TextEditingController controlContrasena = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iniciar Session'),
      ),
      body: Column(children: [
        Textos(gestionTextos: controlCorreo, etiquetas: 'Correo Usuario'),
        Textos(
            gestionTextos: controlContrasena, etiquetas: 'Contraseña Usuario', obscureText: true),
        ElevatedButton(
          onPressed: () {
            IniciarSesion(context);
          },
          child: const Text('Iniciar Session'),
        ),
      ]
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (_) => const RegistrarUsuario(),
              )
            ).then((resultado) {
                _persona.addAll(resultado);
                setState(() {});
              }
            );
          },
          child: const Icon(Icons.person_add, size: 30.0,),
        ),
    );
  }

  IniciarSesion(context) {
    var valid = _persona.firstWhere(
      (p) => p.correo == controlCorreo.text && p.contrasena == controlContrasena.text,
      orElse:() => Persona());

    if(valid.correo != null){
      Navigator.push(context, 
        MaterialPageRoute(builder: (context) => ListarLibros())
      );
      showDialog(context: context, 
        builder: (_) => const AlertDialog(
          title: const Text('Iniciar Secion'),
          content: Text('Bienvenid@'),
        ));
    }else{
      showDialog(context: context, 
        builder: (_) => const AlertDialog(
          title: const Text('Iniciar Secion'),
          content: Text('Datos Incorrectos'),
        ));
    }
  }
}
