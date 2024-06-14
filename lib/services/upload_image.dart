
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<bool> uploadImage(File image) async {
  try {
    print('Uploading image: ${image.path}');

    final String namefile = image.path.split('/').last;
    final Reference ref = storage.ref().child('images').child(namefile);
    final UploadTask uploadTask = ref.putFile(image);

    final TaskSnapshot snapshot = await uploadTask;
    final String url = await snapshot.ref.getDownloadURL();

    print('Download URL: $url');
    return true;
  } catch (e) {
    print('Failed to upload image: $e');
    return false;
  }
}








