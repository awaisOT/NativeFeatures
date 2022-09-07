import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:path/path.dart' as path;

import 'package:path_provider/path_provider.dart' as devicepath;

import 'package:flutter/material.dart';

class AddImage extends StatefulWidget {
  final Function addPlaceImage;

  AddImage(this.addPlaceImage);

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  File? imageCaptured;

  Future<void> _addImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? photo = await picker.pickImage(
      source: ImageSource.camera,
    );

    final tempimage = File(photo!.path);

    setState(() {
      imageCaptured = tempimage;
    });

    final appPath = await devicepath.getApplicationDocumentsDirectory();

    final imageName = path.basename(photo.path);

    final savedImage = await imageCaptured!.copy('${appPath.path}/$imageName');

    widget.addPlaceImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          height: 100,
          width: 150,
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: imageCaptured != null
              ? Image.file(
                  imageCaptured!,
                  width: 150,
                )
              : const Text('no image captured yet'),
        ),
        IconButton(
          onPressed: _addImage,
          icon: const Icon(Icons.camera),
        )
      ],
    );
  }
}
