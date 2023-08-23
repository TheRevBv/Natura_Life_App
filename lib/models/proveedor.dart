class Proveedor {
  final int idProveedor;
  final int idUsuario;
  final int idStatus;
  final String direccion;
  final String telefono;
  final String rfc;
  final String razonSocial;
  final String nombre;
  final String apellido;
  final String correo;
  final String password;
  final String fechaNacimiento;
  final String foto;

  Proveedor(
      {required this.idProveedor,
      required this.idUsuario,
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

  factory Proveedor.fromJson(Map<String, dynamic> json) {
    return Proveedor(
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
  }

  Map<String, dynamic> toJson() => {
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
}
