import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nativefeatures/Providers/places_provider.dart';
import 'package:nativefeatures/widgets/add_image.dart';
import 'package:provider/provider.dart';

class AddPlace extends StatefulWidget {
  static const routename = '/add_place';

  @override
  _AddPlaceState createState() => _AddPlaceState();
}

class _AddPlaceState extends State<AddPlace> {
  final _titleController = TextEditingController();

  File? selectedimage;

  void selectedImage(File savedimage) {
    selectedimage = savedimage;
  }

  void savePlace() {
    if (_titleController.text.isEmpty || selectedimage == null) {
      return;
    }
    Provider.of<PlacesProvider>(context, listen: false).addPlace(_titleController.text, selectedimage as File);
    Navigator.of(context).pop();
    print('item saved');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                ),
                TextField(
                  decoration: const InputDecoration(label: Text('title')),
                  controller: _titleController,
                ),
                const SizedBox(height: 20),
                AddImage(selectedImage),
              ],
            ),
          )),
          ElevatedButton.icon(
              onPressed: savePlace,
              icon: const Icon(Icons.save),
              label: const Text('Save the Form')),
        ],
      ),
    );
  }
}
