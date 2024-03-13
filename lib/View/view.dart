import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../Model/model.dart';
import '../ViewModel/view_model.dart';
import 'view2.dart';

class ModelView extends StatefulWidget {
  const ModelView({Key? key}) : super(key: key);

  @override
  State<ModelView> createState() => _ModelViewState();
}

class _ModelViewState extends State<ModelView> {
  late Future<List<ModelClass>> _modelDataFuture;

  @override
  void initState() {
    super.initState();
    _modelDataFuture = ViewModelClass()
        .fetchModel(); // Fetch model data when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Model Example'),
        backgroundColor: Colors.amber[300],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<ModelClass>>(
          future: _modelDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<ModelClass>? ModelClasss = snapshot.data;
              if (ModelClasss != null && ModelClasss.isNotEmpty) {
                return ListView.builder(
                  itemCount: ModelClasss.length,
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
      ),
    );
  }

  Widget buildListModelClass(ModelClass ModelClass) {
    return Column(
      children: [
        if (ModelClass.type == "Area")
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Maps",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          ),
        const SizedBox(height: 8.0),
        if (ModelClass.type == "HighlightedProperty")
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: ((context) => View2Page())));
            },
            child: Container(
              height: 250.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow, width: 8)),
              child: Image.network(ModelClass.image.toString(),
                  width: double.maxFinite, fit: BoxFit.cover),
            ),
          )
        else
          SizedBox(
            height: 150.0,
            child: Image.network(ModelClass.image.toString(),
                fit: BoxFit.cover, width: double.maxFinite),
          ),
        const SizedBox(height: 20.0),
        Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ModelClass.streetAddress ?? ModelClass.area.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 8.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ModelClass.area != null
                    ? ModelClass.municipality != null
                        ? '${ModelClass.area},${ModelClass.municipality}'
                        : "Rating:${ModelClass.ratingFormatted}"
                    : "",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ModelClass.askingPrice != null
                  ? ModelClass.askingPrice.toString()
                  : "Average price :${ModelClass.averagePrice}M²",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              ModelClass.livingArea != null
                  ? '${ModelClass.livingArea.toString()}M²'
                  : "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              ModelClass.numberOfRooms != null
                  ? '${ModelClass.numberOfRooms.toString()}rooms'
                  : "",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
