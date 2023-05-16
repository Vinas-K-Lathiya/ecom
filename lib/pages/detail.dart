import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../product/model.dart';
import '../product/product_list.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Product d = ModalRoute.of(context)!.settings.arguments as Product;
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text(
          "Detail Page",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.of(context).pop('HomePage');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (!AddedProducts.contains(d)) {
            AddedProducts.add(d);
          } else {
            stdout.write("No data Available...");
          }
          Navigator.of(context).pushNamed('Cart');
        },
        child: const Icon(CupertinoIcons.shopping_cart),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: d.images
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.all(5),
                          height: 421,
                          width: w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(e), fit: BoxFit.cover),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
          Positioned(
            top: 400,
            child: Container(
              height: h * 0.4,
              width: w,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              d.title,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "\$ ${d.price}",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            d.category,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            " ⭐️ ${d.rating}",
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Brand",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            d.brand,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Stock",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "${d.stock}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Description",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        d.description,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
