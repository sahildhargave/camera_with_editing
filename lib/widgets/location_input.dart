import "package:flutter/material.dart";
import 'package:location/location.dart';
import '../models/place.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 170,
          width: double.infinity,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: _previewImageUrl == null
              ? Text(
                  "No Location Chosen",
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
              icon: Icon(
                Icons.location_on,
              ),
              label: const Text("Current Location",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onPressed: _getCurrentUserLocation),
          SizedBox(
            width: 20,
          ),
          ElevatedButton.icon(
              icon: Icon(
                Icons.map,
              ),
              label: const Text("Select on map",
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onPressed: () {}),
        ],
      )
    ]);
  }
}
