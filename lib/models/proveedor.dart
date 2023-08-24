import 'dart:convert';

class Provider {
  int? idProveedor;
  int? idUsuario;
  int idStatus;
  String direccion;
  String telefono;
  String rfc;
  String razonSocial;
  String nombre;
  String apellido;
  String correo;
  String password;
  String fechaNacimiento;
  String? foto;

  Provider(
      {this.idProveedor,
      this.idUsuario,
      required this.idStatus,
      required this.direccion,
      required this.telefono,
      required this.rfc,
      required this.razonSocial,
      required this.nombre,
      required this.apellido,
      required this.correo,
      required this.password,
      required this.fechaNacimiento,
      required this.foto});

  factory Provider.fromJson(String str) => Provider.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Provider.fromMap(Map<String, dynamic> json) => Provider(
      idProveedor: json['idProveedor'],
      idUsuario: json['idUsuario'],
      idStatus: json['idStatus'],
      direccion: json['direccion'],
      telefono: json['telefono'],
      rfc: json['rfc'],
      razonSocial: json['razonSocial'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      correo: json['correo'],
      password: json['password'],
      fechaNacimiento: json['fechaNacimiento'],
      foto: json['foto']);

  Map<String, dynamic> toMap() => {
        'idProveedor': idProveedor,
        'idUsuario': idUsuario,
        'idStatus': idStatus,
        'direccion': direccion,
        'telefono': telefono,
        'rfc': rfc,
        'razonSocial': razonSocial,
        'nombre': nombre,
        'apellido': apellido,
        'correo': correo,
        'password': password,
        'fechaNacimiento': fechaNacimiento,
        'foto': foto
      };

  Provider copy() => Provider(
      idProveedor: idProveedor,
      idUsuario: idUsuario,
      idStatus: idStatus,
      direccion: direccion,
      telefono: telefono,
      rfc: rfc,
      razonSocial: razonSocial,
      nombre: nombre,
      apellido: apellido,
      correo: correo,
      password: password,
      fechaNacimiento: fechaNacimiento,
      foto: foto);
}
