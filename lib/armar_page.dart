

// APARECEN EN FORMA DE GALERIA

// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'dart:io'; // Importa 'dart:io' para manejar archivos
// import 'package:image_picker/image_picker.dart';


// class ArmarPage extends StatefulWidget {
//   const ArmarPage({Key? key}) : super(key: key);

//   @override
//   _ArmarPageState createState() => _ArmarPageState();
// }

// class _ArmarPageState extends State<ArmarPage> {
//   List<String> selectedImages = []; // Lista para almacenar las imágenes seleccionadas

//   Future<List<Map<String, String>>> _loadImages() async {
//     final List<Map<String, String>> files = [];

//     final storageRef = FirebaseStorage.instance.ref().child('images');
//     final listResult = await storageRef.listAll();

//     for (var item in listResult.items) {
//       final url = await item.getDownloadURL();
//       files.add({'name': item.name, 'url': url});
//     }

//     return files;
//   }

//   Future<void> _selectImages() async {
//     final picker = ImagePicker();
//     final pickedImages = await picker.pickMultiImage(); // Permite al usuario seleccionar múltiples imágenes desde la galería
//     if (pickedImages != null) {
//       setState(() {
//         selectedImages = pickedImages.map((image) => image.path).toList(); // Almacena las rutas de las imágenes seleccionadas
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Armar Conjuntos',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Color.fromRGBO(10, 9, 22, 1),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Color.fromRGBO(234, 205, 101, 1)),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromRGBO(31, 29, 66, 1),
//               Color.fromRGBO(10, 9, 22, 1),
//             ],
//           ),
//         ),
//         child: FutureBuilder<List<Map<String, String>>>(
//           future: _loadImages(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text(
//                   'Error: ${snapshot.error}',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               );
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }

//             final files = snapshot.data ?? [];

//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: _selectImages, // Llama a la función para seleccionar imágenes cuando se presiona el botón
//                   child: Text('Seleccionar Imágenes'),
//                 ),
//                 SizedBox(height: 20),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemCount: selectedImages.length, // Usa las imágenes seleccionadas en lugar de todas las imágenes disponibles
//                     itemBuilder: (context, index) {
//                       return Image.file(
//                         File(selectedImages[index]), // Muestra las imágenes seleccionadas
//                         fit: BoxFit.cover,
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
















// // CODIGO ANTES DE CORREGIR LOS TAMAÑOS | original
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class ArmarPage extends StatelessWidget {
//   const ArmarPage({Key? key}) : super(key: key);

//   Future<List<Map<String, String>>> _loadImages() async {
//     final List<Map<String, String>> files = [];

//     final storageRef = FirebaseStorage.instance.ref().child('images');
//     final listResult = await storageRef.listAll();

//     for (var item in listResult.items) {
//       final url = await item.getDownloadURL();
//       files.add({'name': item.name, 'url': url});
//     }

//     return files;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Armar Conjuntos',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Color.fromRGBO(10, 9, 22, 1),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Color.fromRGBO(234, 205, 101, 1)),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromRGBO(31, 29, 66, 1),
//               Color.fromRGBO(10, 9, 22, 1),
//             ],
//           ),
//         ),
//         child: FutureBuilder<List<Map<String, String>>>(
//           future: _loadImages(),
//           builder: (context, snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text(
//                   'Error: ${snapshot.error}',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               );
//             }

//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator());
//             }

//             final files = snapshot.data ?? [];

//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 for (int i = 0; i < 3; i++)
//                   if (i < files.length)
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Lógica para seleccionar la imagen
//                         },
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.zero,
//                           backgroundColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: Container(
//                           width: double.infinity,
//                           height: 200,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image: NetworkImage(files[i]['url']!),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   else
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Lógica para seleccionar la imagen
//                         },
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.zero,
//                           backgroundColor: Colors.transparent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: Container(
//                           width: double.infinity,
//                           height: 200,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.grey[200],
//                           ),
//                           child: Icon(Icons.add, size: 50, color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Escoje tu outfit',
//                   style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ArmarPage extends StatefulWidget {
  const ArmarPage({Key? key}) : super(key: key);

  @override
  _ArmarPageState createState() => _ArmarPageState();
}

class _ArmarPageState extends State<ArmarPage> {
  Future<List<Map<String, String>>> _loadImages() async {
    final List<Map<String, String>> files = [];
    final storageRef = FirebaseStorage.instance.ref().child('images');
    final listResult = await storageRef.listAll();

    for (var item in listResult.items) {
      final url = await item.getDownloadURL();
      files.add({'name': item.name, 'url': url});
    }

    return files;
  }

  List<int> _currentIndex = [0, 0, 0];

  void _showNextImage(int sectionIndex, List<Map<String, String>> files) {
    setState(() {
      if (_currentIndex[sectionIndex] < files.length - 1) {
        _currentIndex[sectionIndex]++;
      } else {
        _currentIndex[sectionIndex] = 0;
      }
    });
  }

  void _showPreviousImage(int sectionIndex, List<Map<String, String>> files) {
    setState(() {
      if (_currentIndex[sectionIndex] > 0) {
        _currentIndex[sectionIndex]--;
      } else {
        _currentIndex[sectionIndex] = files.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Armar Conjuntos',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(10, 9, 22, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromRGBO(234, 205, 101, 1)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(31, 29, 66, 1),
              Color.fromRGBO(10, 9, 22, 1),
            ],
          ),
        ),
        child: FutureBuilder<List<Map<String, String>>>(
          future: _loadImages(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final files = snapshot.data ?? [];

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_left, color: Colors.white, size: 30),
                          onPressed: () => _showPreviousImage(i, files),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Lógica para seleccionar la imagen
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: files.isNotEmpty
                                      ? NetworkImage(files[_currentIndex[i]]['url']!)
                                      : const AssetImage('assets/images/placeholder.png') as ImageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.arrow_right, color: Colors.white, size: 30),
                          onPressed: () => _showNextImage(i, files),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                const Text(
                  'Escoje tu outfit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
