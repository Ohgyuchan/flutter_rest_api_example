import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    const MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Picture> _data = [];
  int page = 1;
  int limit = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: AppBar(
        title: const Text(
          "REST API(HTTP & JSON)",
        ),
        actions: [
          IconButton(
            onPressed: () {
              _fetchData();
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Text(
                    _data[index].author,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Image.network(
                      'https://picsum.photos/id/${_data[index].id}/300/300')
                ],
              ),
            );
          }),
    );
  }

  _fetchData() async {
    var response = await http.get(Uri.parse(
      'https://picsum.photos/v2/list?page=$page&limit=$limit',
    ));
    if (response.statusCode == 200) {
      String jsonString = response.body;
      print(jsonString);

      List pictures = jsonDecode(jsonString);

      for (var picture in pictures) {
        Picture pictureToAdd =
            Picture(id: picture["id"], author: picture["author"]);
        print(pictureToAdd.author);

        setState(() {
          _data.add(pictureToAdd);
          page++;
        });
      }
    } else {
      print('error');
    }
  }
}

class Picture {
  String id;
  String author;

  Picture({required this.id, required this.author});
}
