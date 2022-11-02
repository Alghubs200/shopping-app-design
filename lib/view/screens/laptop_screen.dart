import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvc_design/controller/remote_services.dart';
import 'package:mvc_design/model/products_model.dart';
import 'package:mvc_design/view/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class LaptopScreen extends StatefulWidget {
  const LaptopScreen({super.key});

  @override
  State<LaptopScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<LaptopScreen> {
  late TextEditingController laptopcontroller;

  List<ProductModel>? tempProducts = [];
  List<ProductModel>? product = [];
  List<ProductModel>? getFilteredProducts(String query) {
    if (query.isEmpty) {
      return tempProducts;
    }
    final filteredProducts = product
        ?.where((element) =>
            element.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return filteredProducts;
  }

  var isLoaded = false;

  @override
  void initState() {
    laptopcontroller = TextEditingController();
    super.initState();

    getData();
  }

  getData() async {
    product = await RemoteService().getProductModel();
    if (product != null) {
      tempProducts = product;
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void dispose() {
    laptopcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 26,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Icon(Icons.arrow_circle_left_outlined),
                              height: 57,
                              width: 57,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.grey),
                                  shape: BoxShape.circle),
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: TextField(
                                  onTap: () {},
                                  onChanged: (value) {
                                    final newProducts =
                                        getFilteredProducts(value);
                                    setState(() {
                                      product = newProducts;
                                    });
                                  },
                                  onSubmitted: (value) {
                                    final newProducts =
                                        getFilteredProducts(value);
                                    setState(() {
                                      product = newProducts;
                                    });
                                  },
                                  controller: laptopcontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    hintText: 'Search On Laptop',
                                    prefixIcon: const Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: product?.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final products = product?[index];

                          return Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: product!.isNotEmpty
                                  ? ListTile(
                                      title: Text(
                                          product![index].title.toString()),
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            product![index].image.toString()),
                                      ))
                                  : const Text('No data'));
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'asset/best_laptops.PNG'),
                                          fit: BoxFit.cover),
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(24)),
                                  height: 155,
                                  width: 250,
                                ),
                                const Positioned(
                                    left: 77,
                                    child: Text(
                                      'Best Laptops',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )),
                                const Positioned(
                                    left: 99,
                                    top: 20,
                                    child: Text(
                                      'in 2022',
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            const SizedBox(
                              width: 40,
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: 155,
                                  width: 66,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(24)),
                                ),
                                Positioned(
                                  top: 70,
                                  left: 21,
                                  child: Container(
                                    child: Icon(Icons.filter_alt_outlined),
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.black, width: 1.3)),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26, right: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Featured',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Expanded(
                              child: SizedBox(
                                width: 10,
                              ),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    primary: Colors.purple,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24))),
                                onPressed: () {},
                                child: Text('See more')),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                        visible: isLoaded,
                        child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: product?.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 0.0,
                                    mainAxisSpacing: 30,
                                    childAspectRatio: 0.6),
                            itemBuilder: (BuildContext, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Container(
                                  height: 270,
                                  width: 205,
                                  color: Colors.white,
                                  child: Stack(
                                    children: [
                                      Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 18),
                                              child: Text(product![index]
                                                  .title
                                                  .toString()),
                                            ),
                                          ],
                                        ),
                                        width: 184,
                                        height: 310,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: sqrt1_2, top: sqrt1_2),
                                        child: Container(
                                          width: 182,
                                          height: 194,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  scale: 1,
                                                  image: NetworkImage(
                                                    product![index]
                                                        .image
                                                        .toString(),
                                                  )),
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                        ),
                                      ),
                                      Positioned(
                                        top: 290,
                                        left: 62,
                                        child: Container(
                                          child: Center(
                                              child: Text(
                                            "\$${product![index].price.toString()}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                          decoration: BoxDecoration(
                                              color: Colors.indigo[900],
                                              borderRadius:
                                                  BorderRadius.circular(24)),
                                          width: 64,
                                          height: 33,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        replacement: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ]))));
  }
}
