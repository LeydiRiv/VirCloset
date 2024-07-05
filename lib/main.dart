import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vircloset/firebase_options.dart'; // Asegúrate de que este archivo existe y está configurado correctamente
import 'package:vircloset/menu_page.dart'; // Importa la nueva página del menú

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //Linea para eliminar el debug
      title: 'VirCloset',
      home: MenuPage(), // Cargamos la página del menú
    );
  }
}



