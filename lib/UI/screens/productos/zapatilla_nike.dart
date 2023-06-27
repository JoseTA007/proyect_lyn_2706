import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lym_proyect/UI/widget_wasap/launcher_comprar.dart';

class ZapatillaNike1 extends StatefulWidget {
  const ZapatillaNike1({super.key});

  @override
  State<ZapatillaNike1> createState() => _ZapatillaNike1State();
}

class _ZapatillaNike1State extends State<ZapatillaNike1> {
  int selectTallaCheckBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    'Zapatillas Deportivas',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/imagenes/foto1.jpg',
                                height: 200,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'PRECIO \n S/. 80.90 \n COLOR: ',
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.black,
                                    ),
                                    Icon(
                                      Icons.circle,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                                const Text(
                                  'TALLA',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    const Text('38'),
                                    Checkbox(
                                        value: selectTallaCheckBox == 1,
                                        onChanged: (value) {
                                          setState(() {
                                            _onCheckboxChanged(1);
                                          });
                                        }),
                                    const Text('40'),
                                    Checkbox(
                                        value: selectTallaCheckBox == 2,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _onCheckboxChanged(2);
                                          });
                                        }),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('42'),
                                    Checkbox(
                                        value: selectTallaCheckBox == 3,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _onCheckboxChanged(3);
                                          });
                                        }),
                                    const Text('44'),
                                    Checkbox(
                                        value: selectTallaCheckBox == 4,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            _onCheckboxChanged(4);
                                          });
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 75,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Column(
                    children: [
                      Text(
                        'DESCRIPCION DEL PRODUCTO \n ZAPAPTILLAS DEPORTIVAS MARCA NIKE \n CODIGO: 336666',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        enviarComprarMensajeWhastApp(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade900,
                          shadowColor: Colors.yellow,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(
                            color: Colors.red,
                          )),
                      child: const Text(
                        'COMPRAR',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shadowColor: Colors.white,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          side: const BorderSide(
                            color: Colors.black,
                          )),
                      child: const Text(
                        'AGREGAR',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple.shade300),
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Text(
                        'PRODUCTOS SIMILARES',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: GestureDetector(
                                      child: Image.asset(
                                        'assets/imagenes/foto2.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Zapatillas nicke')
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: GestureDetector(
                                      child: Image.asset(
                                        'assets/imagenes/foto6.jpg',
                                        height: 120,
                                        width: 120,
                                        fit: BoxFit.cover,
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text('Zapatillas nicke')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCheckboxChanged(int checkboxIndex) {
    setState(() {
      selectTallaCheckBox = checkboxIndex;
    });
  }
}
