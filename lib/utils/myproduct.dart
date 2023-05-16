import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../product/model.dart';
import '../product/product_list.dart';

Widget getProduct(
    {required String category,
    required String dispname,
    double mp = 1,
    double mxp = 2000}) {
  return Builder(builder: (context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15),
        Text(
          dispname,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: Allproducts.map(
              (e) => (e['category'] == category)
                  ? (e['price'] >= mp.toInt() && e['price'] <= mxp.toInt())
                      ? Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () {
                              Product p1 = Product(
                                id: e['id'],
                                title: e['title'],
                                description: e['description'],
                                price: e['price'],
                                discountPercentage: e['discountPercentage'],
                                rating: e['rating'],
                                stock: e['stock'],
                                brand: e['brand'],
                                category: e['category'],
                                thumbnail: e['thumbnail'],
                                images: e['images'],
                              );
                              Navigator.of(context)
                                  .pushNamed('DetailPage', arguments: p1);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width * 0.5,
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: (BorderRadius.circular(20)),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(blurRadius: 8, color: Colors.grey),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  e['thumbnail'],
                                                ),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 70,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(10),
                                            ),
                                          ),
                                          child: Text(
                                            "${e['discountPercentage'].toString()} %",
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e['title'],
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "\$ ${e['price']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            RatingBarIndicator(
                                              itemBuilder: (context, index) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 20,
                                              direction: Axis.horizontal,
                                              rating: e['rating'].toDouble(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                      : SizedBox(
                          height: MediaQuery.of(context).size.height * 0.45,
                          width: MediaQuery.of(context).size.width,
                          child: const Center(
                            child:
                                Text("No Product Available in this Range..."),
                          ),
                        )
                  : Container(),
            ).toList(),
          ),
        ),
      ],
    );
  });
}
