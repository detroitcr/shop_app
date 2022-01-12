import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddingData extends StatelessWidget {
  TextEditingController name = TextEditingController();

  TextEditingController description = TextEditingController();

  TextEditingController image = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(hintText: 'name'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: description,
                    decoration: InputDecoration(hintText: 'description'),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: image,
                    decoration: InputDecoration(hintText: 'image'),
                  ),
                  TextFormField(
                    controller: price,
                    decoration: InputDecoration(hintText: 'price'),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        Map<String, dynamic> data = {
                          'date': DateTime.now(),
                          'name': name.text.trim(),
                          'description': description.text.trim(),
                          'image': image.text.trim(),
                          'price': price.text.trim(),
                        };
                        FirebaseFirestore.instance
                            .collection('product')
                            .add(data);
                      },
                      child: Text('submit')),
                ],
              ),
            ),
          ),
        ));
  }
}
