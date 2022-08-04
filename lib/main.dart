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
  final List _data = [];

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
            return Center(
              child: Text(
                _data[index],
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
    );
  }

  _fetchData() async {
    int page = 1;
    int limit = 20;
    var response = await http.get(Uri.parse(
      'https://picsum.photos/v2/list?page=$page&limit=$limit',
    ));
    if (response.statusCode == 200) {
      String jsonString = response.body;
      print(jsonString);
    } else {
      print('error');
    }
  }
}
