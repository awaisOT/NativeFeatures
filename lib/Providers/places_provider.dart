import 'dart:io';
import 'package:flutter/foundation.dart';
import '../model/place_model.dart';
import '../helper/db_helper.dart';

class PlacesProvider extends ChangeNotifier {
  List<Place> _items = [];
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
    DbPlace.dbase('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DbPlace.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }
}
