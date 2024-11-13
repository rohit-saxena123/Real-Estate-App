import 'package:flutter/material.dart';
import 'package:bhoomi_app/property_model.dart'; // Import the Property model

class DetailsPage extends StatelessWidget {
  final Property property;

  DetailsPage({required this.property});

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size;
    final width=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(property.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Image.network(property.imageUrl,width: 400, height:210,),
            Padding(
              padding: const EdgeInsets.all(16.0),

                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        property.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        property.location,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Price: ${property.price}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Additional details about the property can go here...',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),

            ),
          ],
        ),
      ),
    );
  }
}
