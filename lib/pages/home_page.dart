import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../product/product_list.dart';
import '../utils/myproduct.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

String? e;

class _HomePageState extends State<HomePage> {
  String? selectcategory;
  RangeValues rangevalue = const RangeValues(1, 2000);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Home Page",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            child: IconButton(
              icon: const Icon(CupertinoIcons.shopping_cart,
                  size: 25, color: Colors.grey),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pushNamed('Cart');
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          DropdownButton(
                            hint: const Text(
                              "Select Category..",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            value: selectcategory,
                            items: Category.map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                () {
                                  selectcategory = val;
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Visibility(
                            visible: selectcategory != null,
                            child: ActionChip(
                              label: const Text("Clear"),
                              avatar: const Icon(CupertinoIcons.clear),
                              onPressed: () {
                                setState(() {
                                  selectcategory = null;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Visibility(
                        visible: selectcategory != null,
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Row(
                            children: [
                              Text(
                                "form \n\$ ${rangevalue.start.toInt()}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Expanded(
                                child: RangeSlider(
                                  values: rangevalue,
                                  divisions: 2000,
                                  labels: RangeLabels(
                                    rangevalue.start.toInt().toString(),
                                    rangevalue.end.toInt().toString(),
                                  ),
                                  min: 1,
                                  max: 2000,
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        rangevalue = val;
                                      },
                                    );
                                  },
                                ),
                              ),
                              Text(
                                "form \n\$ ${rangevalue.end.toInt()}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      (selectcategory == null)
                          ? Column(
                              children: [
                                getProduct(
                                    category: "smartphones",
                                    dispname: "Smartphone"),
                                getProduct(
                                    category: "laptops", dispname: "Laptop"),
                                getProduct(
                                    category: "fragrances",
                                    dispname: "Fragrances"),
                                getProduct(
                                    category: "skincare", dispname: "SkinCare"),
                                getProduct(
                                    category: "groceries",
                                    dispname: "Groceries"),
                                getProduct(
                                    category: "home-decoration",
                                    dispname: "Home-Decoration"),
                                getProduct(
                                    category: "furniture",
                                    dispname: "Furniture"),
                                getProduct(category: "tops", dispname: "Tops"),
                                getProduct(
                                    category: "womens-dresses",
                                    dispname: "Womens-Dresses"),
                                getProduct(
                                    category: "womens-shoes",
                                    dispname: "Womens-Shoes"),
                                getProduct(
                                    category: "mens-shirts",
                                    dispname: "Mens-Shirts"),
                                getProduct(
                                    category: "mens-shoes",
                                    dispname: "Mens-Shoes"),
                                getProduct(
                                    category: "mens-watches",
                                    dispname: "Mens-Watches"),
                                getProduct(
                                    category: "womens-watches",
                                    dispname: "Womens-Watches"),
                                getProduct(
                                    category: "womens-bags",
                                    dispname: "Womens-Bags"),
                                getProduct(
                                    category: "womens-jewellery",
                                    dispname: "Womens-Jewellery"),
                                getProduct(
                                    category: "sunglasses",
                                    dispname: "SunGlasses"),
                                getProduct(
                                    category: "automotive",
                                    dispname: "AutoMotive"),
                                getProduct(
                                    category: "motorcycle",
                                    dispname: "MotorCycle"),
                                getProduct(
                                    category: "lighting", dispname: "Lighting"),
                              ],
                            )
                          : getProduct(
                              category: selectcategory!,
                              dispname: selectcategory!,
                              mp: rangevalue.start,
                              mxp: rangevalue.end,
                            )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
