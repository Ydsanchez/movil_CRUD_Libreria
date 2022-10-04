import 'package:flutter/material.dart';
import 'package:taller_login/domain/modelo/libro.dart';
import 'package:taller_login/ui/interfaces/widgets.dart';

class CrearLibros extends StatefulWidget {
  final Libro gestionLibro;
  const CrearLibros({super.key, required this.gestionLibro});

  @override
  State<CrearLibros> createState() => _CrearLibrosState();
}

class _CrearLibrosState extends State<CrearLibros> {
  final List<Libro> _addLibro = [];

  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlEscritor = TextEditingController();
  TextEditingController controlEditor = TextEditingController();
  TextEditingController controlGenero = TextEditingController();
  TextEditingController controlCantidad = TextEditingController();

  @override
  void initState() {
    controlNombre.text = widget.gestionLibro.nombre;
    controlEscritor.text = widget.gestionLibro.escritor;
    controlEditor.text = widget.gestionLibro.editor;
    controlGenero.text = widget.gestionLibro.genero;
    controlCantidad.text = widget.gestionLibro.cantidad.toString();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Libro')),
      body: Column(
        children: [
          Textos(gestionTextos: controlNombre, etiquetas: 'Nombre del Libro'),
          Textos(gestionTextos: controlEscritor, etiquetas: 'Nombre del Autor'),
          Textos(gestionTextos: controlEditor, etiquetas: 'Nombre del Editor'),
          Textos(gestionTextos: controlGenero, etiquetas: 'Genero del Libro'),
          Textos(gestionTextos: controlCantidad, etiquetas: 'Cantidad de Libros'),
          ElevatedButton(onPressed: () {
            _addLibro.add(
              Libro(
                nombre: controlNombre.text,
                escritor: controlEscritor.text,
                editor: controlEditor.text,
                genero: controlGenero.text,
                cantidad: controlCantidad.text.toString(),
              )
            );
            Navigator.pop(context, _addLibro);
          }, child: const Text('Guardar Libro'))
        ],
      ),
    );
  }
}