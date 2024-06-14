import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ClosetPage extends StatelessWidget {
  const ClosetPage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Armario',
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

            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Número de columnas en la galería
                crossAxisSpacing: 10, // Espacio horizontal entre elementos
                mainAxisSpacing: 10, // Espacio vertical entre elementos
              ),
              itemCount: files.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(files[index]['url']!),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
