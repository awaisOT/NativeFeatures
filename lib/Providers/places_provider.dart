import 'dart:io';

import 'package:flutter/foundation.dart';
import '../model/place_model.dart';

class PlacesProvider extends ChangeNotifier {
  final List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File selectedImage) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        image: selectedImage,
        location: null);
        _items.add(newPlace);
        notifyListeners();
  }
}

