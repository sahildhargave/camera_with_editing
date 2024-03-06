import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import './add_place_screen.dart';

import '../providers/great_places.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your Places"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        //body: Center(
        //  child: CircularProgressIndicator(
        //    color: Colors.pink,
        //  ),
        //)
        body: FutureBuilder(
            future: Provider.of<GreatPlaces>(context, listen: false)
                .fetchAndSetPlaces(),
            builder: ((context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Consumer<GreatPlaces>(
                        child: const Center(
                          child: Text("Got no places yet , start adding some!"),
                        ),
                        builder: (ctx, greatPlaces, ch) =>
                            greatPlaces.items.length <= 0
                                ? ch!
                                : ListView.builder(
                                    itemCount: greatPlaces.items.length,
                                    itemBuilder: (ctx, i) => ListTile(
                                        leading: CircleAvatar(
                                            backgroundImage: FileImage(
                                          greatPlaces.items[i].image,
                                        )),
                                        title: Text(greatPlaces.items[i].title),
                                        onTap: () {}),
                                  ),
                      ))));
  }
}
