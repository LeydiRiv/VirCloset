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
