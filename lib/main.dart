import 'package:flutter/material.dart';
import 'package:nativefeatures/Providers/places_provider.dart';
import 'package:nativefeatures/screens/add_place.dart';
import 'package:nativefeatures/screens/placeslist.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PlacesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Great Places',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.amber),
        ),
        home: Placeslist(),
        routes: {
          AddPlace.routename: ((context) => AddPlace()),
        },
      ),
    );
  }
}
