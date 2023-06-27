class Cliente {
  int? id;
  String nombre;
  String apellidos;
  String contrasena;
  String comfirmarContrasena;
  String dni;
  String eMail;

  Cliente({
    this.id,
    required this.nombre,
    required this.apellidos,
    required this.contrasena,
    required this.comfirmarContrasena,
    required this.dni,
    required this.eMail,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellidos': apellidos,
      'contrasena': contrasena,
      'comfirmarContrasena': comfirmarContrasena,
      'dni': dni,
      'eMail': eMail,
    };
  }
}
