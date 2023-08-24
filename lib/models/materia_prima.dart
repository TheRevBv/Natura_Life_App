import 'dart:convert';

class MateriaPrima {
  int? id;
  String codigo;
  String nombre;
  String descripcion;
  int perecedero;
  int stock;
  int cantMinima;
  int cantMaxima;
  int idUnidadMedida;
  double precio;
  String? foto;
  int idProveedor;
  int idStatus;
  String? fechaRegistro;
  String? fechaModificacion;

  MateriaPrima({
    this.id,
    required this.codigo,
    required this.nombre,
    required this.descripcion,
    required this.perecedero,
    required this.stock,
    required this.cantMinima,
    required this.cantMaxima,
    required this.idUnidadMedida,
    required this.precio,
    required this.foto,
    required this.idProveedor,
    required this.idStatus,
    this.fechaRegistro,
    this.fechaModificacion,
  });

  factory MateriaPrima.fromJson(String str) =>
      MateriaPrima.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MateriaPrima.fromMap(Map<String, dynamic> json) => MateriaPrima(
        id: json['id'],
        codigo: json['codigo'],
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        perecedero: json['perecedero'],
        stock: json['stock'],
        cantMinima: json['cantMinima'],
        cantMaxima: json['cantMaxima'],
        idUnidadMedida: json['idUnidadMedida'],
        precio: json['precio'],
        foto: json['foto'],
        idProveedor: json['idProveedor'],
        idStatus: json['idStatus'],
        fechaRegistro: json['fechaRegistro'],
        fechaModificacion: json['fechaModificacion'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'codigo': codigo,
        'nombre': nombre,
        'descripcion': descripcion,
        'perecedero': perecedero,
        'stock': stock,
        'cantMinima': cantMinima,
        'cantMaxima': cantMaxima,
        'idUnidadMedida': idUnidadMedida,
        'precio': precio,
        'foto': foto,
        'idProveedor': idProveedor,
        'idStatus': idStatus,
        'fechaRegistro': fechaRegistro,
        'fechaModificacion': fechaModificacion,
      };

  MateriaPrima copy() => MateriaPrima(
        id: id,
        codigo: codigo,
        nombre: nombre,
        descripcion: descripcion,
        perecedero: perecedero,
        stock: stock,
        cantMinima: cantMinima,
        cantMaxima: cantMaxima,
        idUnidadMedida: idUnidadMedida,
        precio: precio,
        foto: foto,
        idProveedor: idProveedor,
        idStatus: idStatus,
        fechaRegistro: fechaRegistro,
        fechaModificacion: fechaModificacion,
      );
}
