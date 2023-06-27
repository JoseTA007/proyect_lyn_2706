import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../base_datos/db_lym.dart';
//import '../base_datos/lista_clientes.dart';

class OlvidoContrasenaPage extends StatefulWidget {
  const OlvidoContrasenaPage({super.key});

  @override
  State<OlvidoContrasenaPage> createState() => _OlvidoContrasenaPageState();
}

class _OlvidoContrasenaPageState extends State<OlvidoContrasenaPage> {
  final _formKeyRecuperarContrasena = GlobalKey<FormState>();
  final TextEditingController eMailController = TextEditingController();
  final TextEditingController dniController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 10, 73, 181),
            title: SizedBox(
              height: 40,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 10, 73, 181),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Row(
                    children: [
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
            ),
          ),
          backgroundColor: const Color.fromRGBO(253, 113, 113, 1),
          body: Container(
            margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
            width: double.infinity,
            child: SingleChildScrollView(
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    Form(
                      key: _formKeyRecuperarContrasena,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Image.asset(
                              'assets/imagenes/logo_LyM.png',
                              height: 200,
                            ),
                          ),
                          Text('NO RECUERDAS TU CONTRASEÑA?',
                              style: GoogleFonts.rubik(fontSize: 22)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                              'No te preocupes!!!, nos sucede a todos. Ingresa tu E-mail y DNI y te ayudaremos.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                  fontSize: 18, color: Colors.brown.shade900)),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                                controller: eMailController,
                                enableInteractiveSelection: false,
                                autofocus: false,
                                textCapitalization:
                                    TextCapitalization.characters,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Tu e-mail es obligatorio";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(15)),
                                  hintText: 'Introduzca su Correo',
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 25),
                                  icon: const Icon(
                                    Icons.email,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                )),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                                controller: dniController,
                                enableInteractiveSelection: false,
                                autofocus: false,
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Tu dni es obligatorio";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide:
                                          const BorderSide(color: Colors.red)),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(15)),
                                  hintText: 'Introduzca su DNI',
                                  labelText: 'DNI',
                                  labelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 25),
                                  icon: const Icon(
                                    Icons.numbers,
                                    color: Colors.black,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(15)),
                                )),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    enviar();
                                  },
                                  child: const Text('ENVIAR')),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.yellow,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {},
                                  child: const Text(
                                    'NUEVO',
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void enviar() async {
    final eMail = eMailController.text;
    final dni = dniController.text;

    final isValid = await DB.validateEmail(eMail, dni);

    if (_formKeyRecuperarContrasena.currentState!.validate()) {
      if (isValid) {
        /*Navigator.pushNamed(
          context,
          '/market_page',
        );*/
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Un administrador se pondra en contacto',
            style: TextStyle(
              color: Colors.green,
              fontSize: 50,
            ),
            textAlign: TextAlign.center,
          )),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'E-MAIL O DNI EQUIVOCADA',
            style: TextStyle(
              color: Colors.red,
              fontSize: 50,
            ),
            textAlign: TextAlign.center,
          )),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
          'FAVOR DE COLOCAR TU E-MAIL Y DNI',
          style: TextStyle(
            color: Colors.red,
            fontSize: 50,
          ),
          textAlign: TextAlign.center,
        )),
      );
    }
  }
}
