import 'package:flutter/material.dart';
import 'package:vircloset/home_page.dart'; // Asegúrate de que esta ruta es correcta
import 'package:vircloset/armar_page.dart'; // Importa la nueva interfaz
import 'package:vircloset/closet_page.dart'; // Importa la página del armario

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(10, 9, 22, 1), // Color secundario
              Color.fromRGBO(62, 63, 97, 1), // Color RGB principal
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Espacio para la imagen
              Container(
                height: 100, // Ajusta el tamaño de la imagen según sea necesario
                width: 100,
                decoration: BoxDecoration(
                    // Agrega la decoración de la imagen si es necesario
                    ),
                // Agrega tu imagen aquí
                child: Image.asset('assets/images/Logo.png'),
              ),
              const SizedBox(height: 20),
              const Text(
                '        VirCloset            ',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Viste lo que te hace feliz, no lo que está de moda',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontFamily: 'TuFuenteElegante', // AGREGAR LA FUENTE
                    fontStyle: FontStyle.italic, // Aplica cursiva
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Acción del botón 1
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(38, 39, 41, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  backgroundColor: Color.fromRGBO(236, 172, 15, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3, // Color del texto del botón
                ),
                child: const Text('Cargar ropa'), // Texto del botón
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  // Acción del botón 2
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ArmarPage()),
                  );
                },
                icon: const Icon(Icons.architecture),
                label: const Text('Armar conjuntos'), // Texto del botón
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(38, 39, 41, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  backgroundColor: const Color.fromRGBO(236, 172, 15, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3, // Color del texto del botón
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Acción del botón 3
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ClosetPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color.fromRGBO(38, 39, 41, 1),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  backgroundColor: const Color.fromRGBO(236, 172, 15, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3, // Color del texto del botón
                ),
                child: const Text('Armario'), // Texto del botón
              ),
            ],
          ),
        ),
      ),
    );
  }
}

