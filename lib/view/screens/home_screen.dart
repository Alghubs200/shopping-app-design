import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mvc_design/model/app_constant.dart';
import 'package:mvc_design/model/categories.dart';
import 'package:mvc_design/view/screens/laptop_screen.dart';
import 'package:mvc_design/view/screens/watch_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listCategory = ListCategory.getListCategory();
    var searchcontroller = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24, left: 24),
                    child: TextField(
                        controller: searchcontroller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24)),
                          hintText: 'Search Product',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24)),
                        )),
                  ),
                ),
                SizedBox(
                  width: 29,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23, right: 26),
                  child: SizedBox(
                    height: 55,
                    width: 100,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24)),
                          onPrimary: Colors.black54,
                          backgroundColor: Colors.white),
                      onPressed: () {},
                      icon: Icon(Icons.card_travel),
                      label: Text('Cart'),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Container(
                    height: 150,
                    width: 360,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/offer1.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.red,
                    ),
                  ),
                ),
                Positioned(
                  left: 190,
                  child: Text(
                    '25% Discount',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 200,
                  top: 22.9,
                  child: Text(
                    'for first purchase',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 90,
                  left: 177,
                  child: SizedBox(
                    height: 25,
                    width: 89,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            elevation: 9,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            primary: Colors.purple,
                            backgroundColor: Colors.white),
                        onPressed: () {},
                        child: Text(
                          'Get it Now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26),
              child: Text(
                'Category',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                height: 55,
                color: Colors.white,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listCategory.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: TextButton(
                          style: TextButton.styleFrom(),
                          onPressed: (() {}),
                          child: Text(
                            listCategory[index].category,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WatchScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 155,
                      height: 165,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          image: DecorationImage(
                              image: AssetImage('asset/Watch.png')),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32, top: 140),
                        child: Text(
                          'Smart Watch',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LaptopScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 155,
                      height: 165,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          image: DecorationImage(
                              image: AssetImage('asset/laptop.jpg')),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 58, top: 140),
                        child: Text(
                          'Laptop',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Container(
                    width: 155,
                    height: 165,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(
                            image: AssetImage('asset/gmaing_laptop.jpg')),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32, top: 140),
                      child: Text(
                        'Gaming Laptop',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 26),
                  child: Container(
                    width: 155,
                    height: 165,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(
                            image: AssetImage('asset/headphone.jpg')),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 42, top: 140),
                      child: Text(
                        'Headphone',
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    ));
  }
}
