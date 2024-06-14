import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portafolio de Viajes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue, // foreground color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
        ),
      ),
      home: const PhotoCarouselScreen(),
    );
  }
}

class PhotoCarouselScreen extends StatefulWidget {
  const PhotoCarouselScreen({Key? key}) : super(key: key);

  @override
  _PhotoCarouselScreenState createState() => _PhotoCarouselScreenState();
}

class _PhotoCarouselScreenState extends State<PhotoCarouselScreen> {
  List<String> _photoPaths = [];

  final ImagePicker _picker = ImagePicker();
  final CarouselController _carouselController = CarouselController();

  Future<void> _addPhoto() async {
    if (kIsWeb) {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _photoPaths.add(pickedFile.path);
        });
      }
    } else {
      if (await Permission.photos.request().isGranted) {
        final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          setState(() {
            _photoPaths.add(pickedFile.path);
          });
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Acceso denegado')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Portafolio de Viajes',
          style: TextStyle(fontSize: 44),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: 400.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: _photoPaths.map((path) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[300], // Cambia el color de fondo del contenedor
                        borderRadius: BorderRadius.circular(10.0), // Agrega bordes redondeados
                      ),
                      child: ClipRRect( // Recorta los bordes de la imagen para que se ajusten al borde del contenedor
                        borderRadius: BorderRadius.circular(10.0),
                        child: kIsWeb
                            ? Image.network(path, fit: BoxFit.cover)
                            : Image.file(File(path), fit: BoxFit.cover),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 16.0), // Agrega un espacio adicional entre el carrusel y los botones
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _carouselController.previousPage();
                },
                icon: Icon(Icons.arrow_left),
                label: Text('Anterior'),
              ),
              SizedBox(width: 16.0), // Agrega un espacio entre los botones de navegación
              ElevatedButton.icon(
                onPressed: () {
                  _carouselController.nextPage();
                },
                icon: Icon(Icons.arrow_right),
                label: Text('Siguiente'),
              ),
            ],
          ),
          SizedBox(height: 16.0), // Agrega un espacio adicional entre los botones y el botón de agregar foto
          ElevatedButton.icon(
            onPressed: _addPhoto,
            icon: Icon(Icons.add_a_photo),
            label: Text('Agregar Foto'),
          ),
        ],
      ),
    );
  }
}
