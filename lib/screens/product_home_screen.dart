import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TitanScreenFirebase extends StatefulWidget {
  const TitanScreenFirebase({Key? key}) : super(key: key);

  @override
  _TitanScreenFirebaseState createState() => _TitanScreenFirebaseState();
}

class _TitanScreenFirebaseState extends State<TitanScreenFirebase> {
  final Stream<QuerySnapshot> characters =
      FirebaseFirestore.instance.collection('product').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'product',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
        ),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: characters,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: const Text('Error'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final data = snapshot.requireData;
            return ListView.builder(
                reverse: true,
                itemCount: data.size,
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                itemBuilder: (context, index) {
                  // final titansD  ata = titans[index];
                  final productData = data.docs[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                      child: Card(
                        elevation: 6,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Image.network(
                                  productData['image'],
                                  fit: BoxFit.cover,
                                  // color: Colors.black,
                                  height: 150,
                                  width: 360,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                  alignment: Alignment.bottomLeft,
                                  height: 150,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(0.05),
                                          Colors.black.withOpacity(0.1),
                                          Colors.black.withOpacity(0.7),
                                        ],
                                        end: Alignment.bottomCenter,
                                        begin: Alignment.topCenter),
                                  ),
                                  child: Text(
                                    productData['name'],
                                    // "Titans",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 22),
                                  ),
                                  // color: Colors.black,
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                productData['description'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
      // body: ListView(
      //   children: [
      //     Padding(
      //       padding:
      //           const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      //       child: _buildTitans(),
      //     )
      //   ],
      // ),
    );
  }
}
