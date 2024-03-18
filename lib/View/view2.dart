import 'package:flutter/material.dart';
import 'package:home_sale_app/Viewmodel/viewmodel2.dart';

class View2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ViewModel2().fetchDetails(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          final property = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Property Details'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(property.image.toString()),
                    const SizedBox(height: 30),
                    Text(
                      '${property.streetAddress}',
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${property.area}' ': ${property.municipality}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${property.askingPrice}',
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      '${property.description}',
                      style: const TextStyle(wordSpacing: 5, height: 2),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const Text(
                          'Living Area: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          ' ${property.livingArea}m2',
                          style: const TextStyle(wordSpacing: 5, height: 2),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Number Of Rooms: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              ' ${property.numberOfRooms}',
                              style: const TextStyle(wordSpacing: 5, height: 2),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Patio:',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              ' ${property.patio}',
                              style: const TextStyle(wordSpacing: 5, height: 2),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Days Since Publish: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              ' ${property.daysSincePublish}',
                              style: const TextStyle(wordSpacing: 5, height: 2),
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
