class Libro {
  var nombre;
  var escritor;
  var editor;
  var genero;
  var cantidad;

  Libro({this.nombre, this.escritor, this.editor, this.genero, this.cantidad});
}

List<Libro> listarLibros = [
  Libro(
    nombre: 'Padre Rico, Padre Pobre',
    escritor: 'Robert T. Kiyosaki',
    editor: 'Debols!llo',
    genero: 'Educacion Financiera',
    cantidad: 5
  ),

  Libro(
    nombre: 'Salon 8',
    escritor: 'Yokoi Kenji Diaz',
    editor: 'Paidos Empresa',
    genero: 'Motivacional',
    cantidad: 1
  )
];