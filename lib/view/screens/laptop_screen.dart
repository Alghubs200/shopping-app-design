import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvc_design/controller/remote_services.dart';
import 'package:mvc_design/model/products_model.dart';
import 'package:mvc_design/view/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LaptopScreen extends StatefulWidget {
  const LaptopScreen({super.key});

  @override
  State<LaptopScreen> createState() => _LaptopScreenState();
}

class _LaptopScreenState extends State<LaptopScreen> {
  List<ProductModel>? product;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    product = await RemoteService().getProductModel();
    if (product != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var laptopcontroller = TextEditingController();
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
                                  controller: laptopcontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                    hintText: 'Search On Laptop',
                                    prefixIcon: Icon(
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
                      SizedBox(
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
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'asset/best_laptops.PNG'),
                                          fit: BoxFit.cover),
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(24)),
                                  height: 155,
                                  width: 250,
                                ),
                                Positioned(
                                    left: 77,
                                    child: Text(
                                      'Best Laptops',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Positioned(
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
                            SizedBox(
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
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 26, right: 28),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Featured',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Expanded(
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
                                    crossAxisSpacing: 0.5,
                                    mainAxisSpacing: 30,
                                    childAspectRatio: 0.9),
                            itemBuilder: (BuildContext, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 26, right: 28),
                                child: Container(
                                  height: 220,
                                  width: 170,
                                  color: Colors.red,
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 155,
                                        height: 250,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                product![index]
                                                    .image
                                                    .toString(),
                                              ),
                                            ),
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(24)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18, top: 148),
                                          child: Text(
                                            product![index].title.toString(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 168,
                                        left: 48,
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
