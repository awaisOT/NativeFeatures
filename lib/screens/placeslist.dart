import 'package:flutter/material.dart';
import 'package:nativefeatures/Providers/places_provider.dart';
import 'package:provider/provider.dart';

import 'add_place.dart';

class Placeslist extends StatelessWidget {
  const Placeslist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlace.routename);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Consumer<PlacesProvider>(builder: ((context, value, child) => ListView.builder(itemBuilder: ((context, index) => ListTile(title:Text(value.items[index].title) ,)), itemCount: value.items.length,))
      ));
  }
}
