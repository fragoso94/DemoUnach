import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  Map<String, dynamic>? entidad;

  DetailPage(this.entidad);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail Page'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,              
              children: [
                Image.network(entidad?['image']),
                Text("Name: ${entidad?['name']}", style: const TextStyle(fontSize: 20.0),),
                Text("Specie: ${entidad?['species']}", style: const TextStyle(fontSize: 20.0),),
              ],
            ),
          ),
        ),
      );
  }
}