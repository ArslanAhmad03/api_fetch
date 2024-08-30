import 'dart:convert';

import 'package:dailywidget/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<MyData> allData = [];

  Future<List<MyData>> getMyDate() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/d39df000-6a5e-4d1c-97f0-4e89f529e0e0'));

    List<MyData> data = [];

    if (response.statusCode == 200) {
      var _dataJson = json.decode(response.body);
      for (var _dataJsons in _dataJson) {
        data.add(MyData.fromJson(_dataJsons));
      }
    } else {
      print('data not found');
    }
    return data;
  }

  @override
  void initState() {
    super.initState();
    getMyDate().then((value) {
      setState(() {
        allData.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fetch data from api'),
      ),
      body: allData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: allData.length,
              itemBuilder: (context, index) {
                return Card(
                  color: allData[index].age! <= 20
                      ? Colors.red
                      : allData[index].age! <= 30
                          ? Colors.yellow
                          : allData[index].age! > 30 && allData[index].age! <= 40
                              ? Colors.grey
                              : Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        allData[index].gender == 'male'
                            ? Chip(
                                label: Text(
                                    "ID: ${allData[index].id}    Age: ${allData[index].age!}"),
                                avatar: const Icon(Icons.man,
                                    size: 20, color: Colors.black))
                            : Chip(
                                label: Text(
                                    "ID: ${allData[index].id}    Age: ${allData[index].age!}"),
                                avatar: const Icon(Icons.girl,
                                    size: 20, color: Colors.red)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Name: ${allData[index].firstName!}  ${allData[index].maidenName!}  ${allData[index].lastName!}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
