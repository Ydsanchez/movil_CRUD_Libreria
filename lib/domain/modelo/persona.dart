class Persona{
  var identificacion;
  var nombre;
  var correo;
  var contrasena;

  Persona({this.identificacion, this.nombre, this.correo, this.contrasena});
}

List<Persona> listaPersona = [
  Persona(
    identificacion: 1003,
    nombre: 'yeferson',
    correo: 'ydsanchez',
    contrasena: 'Yepe1003',
  ),
];