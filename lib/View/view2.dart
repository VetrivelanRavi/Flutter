import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Model/model2.dart';
import '../Viewmodel/viewmodel2.dart';

class View2Page extends StatefulWidget {
  const View2Page({Key? key}) : super(key: key);

  @override
  State<View2Page> createState() => _View2PageState();
}

class _View2PageState extends State<View2Page> {
  late Future<List<Model2>> _view2Future;

  @override
  void initState() {
    super.initState();
    _view2Future = ViewModel2().fetchModel2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model 1st Page',style: TextStyle(),),
        backgroundColor: Colors.yellowAccent[100],
      ),
      body: FutureBuilder<List<Model2>>(
        future: _view2Future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Model2>? ModelClasss = snapshot.data;
            if (ModelClasss != null && ModelClasss.isNotEmpty) {
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final ModelClass = ModelClasss[index];
                  return buildListModelClass(ModelClass);
                },
              );
            } else {
              return Center(child: Text('No data available.'));
            }
          }
        },
      ),
    );
  }

  Widget buildListModelClass(Model2 Model2) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(Model2.image.toString()),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${Model2.streetAddress.toString()}',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${Model2.area.toString()},${Model2.municipality.toString()}',
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Colors.grey),
            ),
          ),
          const SizedBox(height: 4.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${Model2.askingPrice.toString()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${Model2.description}',
            style: TextStyle(wordSpacing: 10),
          ),
        const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Text(
                "Living Area:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                '  ${Model2.livingArea}',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                " m2",
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Number Of Rooms:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '  ${Model2.numberOfRooms}',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Patio:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${Model2.patio}',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Row(
            children: [
             const Text(
                "Days Since publish:",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                ' ${Model2.daysSincePublish}',
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
