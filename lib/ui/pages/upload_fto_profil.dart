import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';

class ImageUploadWidget extends StatefulWidget {
  @override
  _ImageUploadWidgetState createState() => _ImageUploadWidgetState();
}

class _ImageUploadWidgetState extends State<ImageUploadWidget> {
  File? _image;
  final supabase = Supabase.instance.client;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('Silahkan Upload File.');
      }
    });
  }

  void uploadgambar() async {
    if (_image != null) {
      int length = 8;
      String randomNumbers = String.fromCharCodes(
          List.generate(length, (index) => Random().nextInt(10) + 48));
      String extensionFile = _image!.path.split('.').last;
      String fileName = "$randomNumbers.$extensionFile";
      //upload storage
      await supabase.storage.from('user').upload(fileName, _image!,
          fileOptions: FileOptions(cacheControl: '3600', upsert: false));

      //url gambar di strorage
      final url = supabase.storage.from('user').getPublicUrl(fileName);

      print('url:$url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _image == null
            ? Text('Silahkan Upload File')
            : Image.file(
                _image!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              //untuk upload gambar dari komputer
        ElevatedButton(
          onPressed: getImage,
          child: Text('Upload'),
        ),
        // untuk mengunggah file yang sudah dipilih ke database supabase
        ElevatedButton(
            onPressed: () {
              uploadgambar();
            },
            child: Text('simpan')),
      ],
    );
  }
}
