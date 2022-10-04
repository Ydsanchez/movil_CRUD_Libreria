import 'package:flutter/material.dart';
import 'package:taller_login/domain/modelo/persona.dart';
import 'package:taller_login/ui/interfaces/widgets.dart';

class RegistrarUsuario extends StatefulWidget {
  const RegistrarUsuario({super.key});

  @override
  State<RegistrarUsuario> createState() => _RegistrarUsuarioState();
}

class _RegistrarUsuarioState extends State<RegistrarUsuario> {
  final List<Persona> _addPersona = [];

  TextEditingController controlIdentificacion = TextEditingController();
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlCorreo = TextEditingController();
  TextEditingController controlContrasena = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Usuario'),
      ),
      body: Column(
        children: [
          Textos(gestionTextos: controlIdentificacion,etiquetas: 'Identificacion Usuario'),
          Textos(gestionTextos: controlNombre, etiquetas: 'Nombre Usuario'),
          Textos(gestionTextos: controlCorreo, etiquetas: 'Correo Usuario'),
          Textos(
              gestionTextos: controlContrasena,
              etiquetas: 'Contraseña Usuario'),
          ElevatedButton(
              onPressed: () {
                //agregamos valores a la lista
                if (controlIdentificacion.text.isNotEmpty &&
                    controlNombre.text.isNotEmpty &&
                    controlCorreo.text.isNotEmpty &&
                    controlContrasena.text.isNotEmpty) {
                  _addPersona.add(
                    Persona(
                      identificacion: controlIdentificacion.text,
                      nombre: controlNombre.text,
                      correo: controlCorreo.text,
                      contrasena: controlContrasena.text,
                    ),
                  );
                  //se devuelven los valores 
                  Navigator.pop(context, _addPersona);
                  showDialog(context: context, 
                    builder: (_) => const AlertDialog(
                    title: const Text('Registrar'),
                    content: Text('Registro Exitoso'),
                  ));
                }else{
                  showDialog(context: context, 
                    builder: (_) => const AlertDialog(
                    title: const Text('Registrar'),
                    content: Text('Campos Vacios'),
                  ));
                }
              },
              child: const Text('REGISTRAR'))
        ],
      ),
    );
  }
}
