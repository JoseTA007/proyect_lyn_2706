import 'package:google_fonts/google_fonts.dart';
import 'package:lym_proyect/UI/base_datos/db_lym.dart';
import 'package:lym_proyect/UI/base_datos/registro_clientes.dart';
import 'package:flutter/material.dart';

class AgregarCliente extends StatefulWidget {
  const AgregarCliente({super.key});

  @override
  State<AgregarCliente> createState() => _AgregarClienteState();
}

class _AgregarClienteState extends State<AgregarCliente> {
  final _formKey = GlobalKey<FormState>();
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final contrasenaController = TextEditingController();
  final comfirmarContrasenaController = TextEditingController();
  final dniController = TextEditingController();
  final eMailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Cliente cliente = ModalRoute.of(context)?.settings.arguments as Cliente;
    nombreController.text = cliente.nombre;
    apellidoController.text = cliente.apellidos;
    contrasenaController.text = cliente.contrasena;
    comfirmarContrasenaController.text = cliente.comfirmarContrasena;
    dniController.text = cliente.dni;
    eMailController.text = cliente.eMail;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 10, 73, 181),
        title: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text(
              'IMPORTACIONES LyM',
              style: GoogleFonts.caveat(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: CustomScrollView(slivers: <Widget>[
        SliverAppBar(
          backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
          floating: true,
          pinned: true,
          automaticallyImplyLeading: false,
          /*title: SizedBox(
            height: 40,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 10, 73, 181),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'IMPORTACIONES LyM',
                      style: GoogleFonts.caveat(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),*/
          expandedHeight: 300,
          centerTitle: true,
          flexibleSpace: Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            width: double.infinity,
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Image.asset(
                    'assets/imagenes/logo_LyM.png',
                    height: 200,
                    width: 200,
                  ),
                )),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            Container(
              margin: const EdgeInsets.all(20),
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'REGISTRO DE CLIENTES',
                          style: GoogleFonts.caveat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //
                        //    TEXTFROMFIELD

                        //      NOMBRE
                        TextFormField(
                          controller: nombreController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "El nombre es obligatorio";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "Nombre",
                            hintText: 'Ingresa tu nombre',
                            prefixIcon: Icon(Icons.person_outlined),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //  APELLIDOS
                        //
                        TextFormField(
                          controller: apellidoController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "El apellido es obligatoria";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "Apellidos",
                            hintText: 'Ingresa tus Apellidos',
                            prefixIcon: Icon(Icons.person_outlined),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //  CONTRASEÑA
                        //
                        TextFormField(
                          controller: contrasenaController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "La contrasena es obligatoria";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "Contraseña",
                            hintText: 'Ingresa tu contraseña',
                            prefixIcon: Icon(Icons.password),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //  COMFIRMAR CONTRASEÑA
                        //
                        TextFormField(
                          controller: comfirmarContrasenaController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Comfirma tu contraseña";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "Comfirmar contraseña",
                            hintText: 'Ingresa tu contraseña nuevamente',
                            prefixIcon: Icon(Icons.lock),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //  DNI
                        //
                        TextFormField(
                          controller: dniController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Tu dni es obligatorio";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "Dni",
                            hintText: 'Ingresa tu dni',
                            prefixIcon: Icon(Icons.numbers),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        //
                        //  CORREO ELECTRONICO
                        //
                        TextFormField(
                          controller: eMailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Tu E-mail es obligatorio";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.red)),
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelText: "E-mail",
                            hintText: 'Ingresa tu E-mail',
                            prefixIcon: Icon(Icons.email),
                            labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (cliente.id! > 0) {
                                  cliente.nombre = nombreController.text;
                                  cliente.apellidos = apellidoController.text;
                                  cliente.contrasena =
                                      contrasenaController.text;
                                  cliente.comfirmarContrasena =
                                      comfirmarContrasenaController.text;
                                  cliente.dni = dniController.text;
                                  cliente.eMail = eMailController.text;
                                  DB.update(cliente);
                                } else {
                                  DB.insert(Cliente(
                                    nombre: nombreController.text,
                                    apellidos: apellidoController.text,
                                    contrasena: contrasenaController.text,
                                    comfirmarContrasena:
                                        comfirmarContrasenaController.text,
                                    dni: dniController.text,
                                    eMail: eMailController.text,
                                  ));
                                }
                                Navigator.pushNamed(context, '/login_page');
                              }
                            },
                            child: const Text("Guardar")),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )),
      ]),
    ));
  }
}
