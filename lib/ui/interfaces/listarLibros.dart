import 'package:flutter/material.dart';
import 'package:taller_login/ui/interfaces/crearLibro.dart';

import '../../domain/modelo/libro.dart';

class ListarLibros extends StatefulWidget {
  const ListarLibros({super.key});

  @override
  State<ListarLibros> createState() => _ListarLibrosState();
}

class _ListarLibrosState extends State<ListarLibros> {
  final List<Libro> _libros = listarLibros;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listar Libros'),
      ),
      body: ListView.builder(
        itemCount: _libros.length,
        itemBuilder: (context, pos){
          return ListTile(
            //onLongPress: () {
              //eliminar
            //},

            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (_) => CrearLibros(gestionLibro: _libros[pos]),
                ),
              ).then((resultado) {
                  if (resultado != null) {
                    _libros[pos] = resultado[0]; //agregamos los valores a la lista que se agregaron en AgregarLibro

                    showDialog(
                      context: context, 
                      builder: (_) => const AlertDialog(
                        title: const Text('Modificar'),
                        content: Text('Datos Modificados Con Exito'),
                      )
                    );
                    setState(() {});
                  }
                }
              );
            },

            leading: CircleAvatar(
              child: Text(_libros[pos].nombre.substring(0,1) + " . " + _libros[pos].escritor.substring(0,1)),
            ),
            title: Text(_libros[pos].nombre + " / " + _libros[pos].escritor),
            subtitle: Text(_libros[pos].editor + " / " + _libros[pos].genero + " / " + _libros[pos].cantidad.toString()),
            trailing: Icon(Icons.book),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, 
            MaterialPageRoute(builder: (_) => 
              CrearLibros(gestionLibro: Libro(
                    nombre: '',
                    escritor: '',
                    editor: '',
                    genero: '',
                    cantidad: '',
                  ),),
            ),
          ).then((resultado) {
              if (resultado) {
                _libros.addAll(resultado);
                setState(() {});
              }
            }
          );
        }, child: const Icon(Icons.add),
      ),
    );
  }
}