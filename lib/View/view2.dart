import 'package:flutter/material.dart';
import 'package:home_sale_app/Viewmodel/viewmodel2.dart';

class View2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ViewModel2().fetchDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          final property = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text('Property Details'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(property.image.toString()),
                    SizedBox(height: 30),
                    Text(
                      '${property.streetAddress}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${property.area}' ': ${property.municipality}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${property.askingPrice}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      '${property.description}',
                      style: TextStyle(wordSpacing: 5, height: 2),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        const Text(
                          'Living Area: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          ' ${property.livingArea}m2',
                          style: TextStyle(wordSpacing: 5, height: 2),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Number Of Rooms: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              ' ${property.numberOfRooms}',
                              style: TextStyle(wordSpacing: 5, height: 2),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Patio:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              ' ${property.patio}',
                              style: TextStyle(wordSpacing: 5, height: 2),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Days Since Publish: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              ' ${property.daysSincePublish}',
                              style: TextStyle(wordSpacing: 5, height: 2),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
