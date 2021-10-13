import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demo2/pages/detail_page.dart';

class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic>? _entidad;
  List? _listaDatos = [];

  void _getData() async {
    try{
      //String url = "https://fakestoreapi.com/products";
      String url = "https://rickandmortyapi.com/api/character";
      //String url = "https://192.168.100.6:45455/api/User";
      var response = await http.get(Uri.parse(url));
      setState(() {        
        _entidad = jsonDecode(response.body);
        _listaDatos = _entidad?['results'];        
        print(_listaDatos);
      });
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HOME PAGE'),
          centerTitle: true,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: _listaDatos?.length,
            itemBuilder: (context, index){
              final item = _listaDatos?[index];
              return CardView(item);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _getData();
          },
          child: const Icon( Icons.add ),
        ),
      );
  }

  Widget CardView(Map<String, dynamic>? item){    
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(item)));
      },
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInImage(
              placeholder: const AssetImage("assets/loading.gif"),
              image: NetworkImage(item?['image']),
            ),          
            const SizedBox(height: 25.0),
            Text(item?['name'],
              style: const TextStyle(color: Colors.blue, fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

}
