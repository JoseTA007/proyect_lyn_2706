import 'package:sqflite/sqflite.dart';
//import 'package:sqflite_common/sqflite_ffi.dart';
import 'package:lym_proyect/UI/base_datos/registro_clientes.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    //CREACION DE LA BASE DE DATOS
    return openDatabase(join(await getDatabasesPath(), 'clientes.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE clientes (id INTEGER PRIMARY KEY, nombre TEXT, apellidos TEXT, contrasena TEXT, comfirmarContrasena TEXT, dni TEXT, eMail TEXT)",
      );
    }, version: 3);
  }

  //FUNCION INSERT-AGREGAR
  static Future<Future<void>> insert(Cliente cliente) async {
    Database database = await _openDB();
    return database.insert("clientes", cliente.toMap());
  }

  //FUNCION DELETE-ELIMINAR
  static Future<Future<void>> delete(Cliente cliente) async {
    Database database = await _openDB();
    return database.delete("clientes", where: "id= ?", whereArgs: [cliente.id]);
  }

  //FUNCION ACTUALIZAR-UPDATE
  static Future<Future<void>> update(Cliente cliente) async {
    Database database = await _openDB();
    return database.update("clientes", cliente.toMap(),
        where: "id=?", whereArgs: [cliente.id]);
  }

  //FUNCION MOSTRAR BASE DE DATOS
  static Future<List<Cliente>> cliente() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> clienteMap =
        await database.query("clientes");
    return List.generate(
        clienteMap.length,
        (i) => Cliente(
              id: clienteMap[i]['id'],
              nombre: clienteMap[i]['nombre'],
              apellidos: clienteMap[i]['apellidos'],
              contrasena: clienteMap[i]['contrasena'],
              comfirmarContrasena: clienteMap[i]['comfirmarContrasena'],
              dni: clienteMap[i]['dni'],
              eMail: clienteMap[i]['eMail'],
            ));
  }

  //FUNCION PARA VALIDAR EL INGRESO A TRAVES DEL LOGIN
  static Future<bool> validateUser(String eMail, String contrasena) async {
    final database = await _openDB();
    final result = await database.query(
      'clientes',
      where: 'eMail = ? AND contrasena = ?',
      whereArgs: [eMail, contrasena],
    );
    return result.isNotEmpty;
  }

  //FUNCION PARA RECUPERAR CONTRASEÑA
  static Future<bool> validateEmail(
    String eMail,
    String dni,
  ) async {
    final database = await _openDB();
    final result = await database.query(
      'clientes',
      where: 'eMail = ? AND dni = ?  ',
      whereArgs: [
        eMail,
        dni,
      ],
    );
    return result.isNotEmpty;
  }

  /*Future<Object?> getPasswordByUsername(String eMail, String dni) async {
    final db = await _openDB();
    final result = await db.rawQuery(
        'SELECT contrasena FROM clientes WHERE eMail = ? AND dni = ?',
        [eMail, dni]);

    if (result.isNotEmpty) {
      return result.first['contrasena'];
    } else {
      return null;
    }
  }*/
}
