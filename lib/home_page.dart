import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vircloset/services/select_image.dart';
import 'package:vircloset/services/upload_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imagenToUpload;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Elimina la sombra de la AppBar
        backgroundColor: Color.fromRGBO(10, 9, 22, 1), // Color de fondo de la AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Color.fromRGBO(234, 205, 101, 1)), // Cambia el color del icono de flecha
          onPressed: () {
            Navigator.of(context).pop(); // Agrega la acción para retroceder
          },
        ),
      ),
      backgroundColor:   Color.fromRGBO(10, 9, 22, 1),// Color de fondo principal
     
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(31, 29, 66, 1), // Color secundario
              Color.fromRGBO(10, 9, 22, 1), // Color RGB principal
            ],
          ),
        ),
        child: Column(
          children: [
            imagenToUpload != null 
              ? Image.file(imagenToUpload!) 
              : Container(
                  margin: const EdgeInsets.all(10),
                  height: 200,
                  width: double.infinity,
                  color: Color.fromARGB(255, 25, 27, 51),
                  child: const Center(child: Text('Ninguna imagen seleccionada', style: TextStyle(color: Colors.white))),
                ),
            // BOTON 1: Seleccionar imagen
            ElevatedButton(
              onPressed: () async {
                final imagen = await getImage();
                setState(() {
                  if (imagen != null) {
                    imagenToUpload = File(imagen.path);
                  }
                });
              },
              child: const Text('Seleccionar imagen'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(142, 161, 193, 1), // Color del texto del botón
              ),
            ),
            // BOTON 2: Subir a Firebase
            ElevatedButton(
              onPressed: () async {
                if (imagenToUpload == null) {
                  print('Ninguna imagen seleccionada.');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ninguna imagen seleccionada')),
                  );
                  return;
                }
                final uploaded = await uploadImage(imagenToUpload!);
                if (uploaded) {
                  print('File uploaded successfully');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('File uploaded successfully')),
                  );
                } else {
                  print('Failed to upload file.');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Failed to upload file')),
                  );
                }
              },
              child: const Text('Subir a Firebase'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color.fromRGBO(142, 161, 193, 1), // Color del texto del botón
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Sube tu ropa en la nube',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
















//CODIGO ANTES DE LOS ESTILOS

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:vircloset/services/select_image.dart';
// import 'package:vircloset/services/upload_image.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   File? imagenToUpload;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Material App Bar'),
//       ),
//       body: Column(
//         children: [
//           imagenToUpload != null 
//             ? Image.file(imagenToUpload!) 
//             : Container(
//                 margin: const EdgeInsets.all(10),
//                 height: 200,
//                 width: double.infinity,
//                 color: const Color.fromARGB(255, 36, 71, 99),
//                 child: const Center(child: Text('No image selected', style: TextStyle(color: Colors.white))),
//               ),
//           // BOTON 1: Seleccionar imagen
//           ElevatedButton(
//             onPressed: () async {
//               final imagen = await getImage();
//               setState(() {
//                 if (imagen != null) {
//                   imagenToUpload = File(imagen.path);
//                 }
//               });
//             },
//             child: const Text('Seleccionar imagen'),
//           ),
//           // BOTON 2: Subir a Firebase
//           ElevatedButton(
//             onPressed: () async {
//               if (imagenToUpload == null) {
//                 print('No image selected.');
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('No image selected')),
//                 );
//                 return;
//               }
//               final uploaded = await uploadImage(imagenToUpload!);
//               if (uploaded) {
//                 print('File uploaded successfully');
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('File uploaded successfully')),
//                 );
//               } else {
//                 print('Failed to upload file.');
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('Failed to upload file')),
//                 );
//               }
//             },
//             child: const Text('Subir a Firebase'),
//           ),
//         ],
//       ),
//     );
//   }
// }











