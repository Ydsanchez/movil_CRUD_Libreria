import 'package:flutter/material.dart';

class Textos extends StatelessWidget {
  final TextEditingController gestionTextos;
  final String etiquetas;
  final bool obscureText;

  const Textos({
    super.key,
    required this.gestionTextos,
    required this.etiquetas,
    this.obscureText=false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: gestionTextos,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          labelText: etiquetas,
          suffix: GestureDetector(
            child: const Icon(Icons.close),
            onTap: (){
              gestionTextos.clear();
            },
          ) 
        ),
      ),
    );
  }
}