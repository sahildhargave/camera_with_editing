// ignore_for_file: prefer_const_constructors, unused_field
import "dart:io";
import "package:flutter/material.dart";
import "../widgets/image_input.dart";
import "package:provider/provider.dart";
import "../providers/great_places.dart";
import "../widgets/location_input.dart";

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place";

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savedPlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    //return;
    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add A New Place"),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: "Title"),
                        controller: _titleController,
                      ),
                      SizedBox(height: 10),
                      ImageInput(_selectImage),
                      SizedBox(height: 10),
                      LocationInput(),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: const TextStyle(fontSize: 15)),

              icon: Icon(
                Icons.add,
                color: Colors.pink,
              ),
              label: Text(
                'Add Place',
              ),
              onPressed: _savedPlace,
              //elevation: 0,
              //materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //color: Theme.of(context).colorScheme.secondary,
            ),
          ],
        ));
  }
}
