import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:marienatie/screens/components/categories.dart';
import 'package:marienatie/screens/components/itemcard.dart';
import 'package:marienatie/services/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 2;
  final items = [
    const Icon(
      Icons.shopping_cart,
      size: 28,
    ),
    const Icon(
      Icons.favorite,
      size: 28,
    ),
    const Icon(
      Icons.home,
      size: 28,
    ),
    const Icon(
      Icons.chat_bubble_rounded,
      size: 28,
    ),
    const Icon(
      Icons.person,
      size: 28,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 214, 201, 255),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          "assets/default.png",
          height: 160,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      body: FutureBuilder<dynamic>(
          future: getUser(),
          builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (asyncSnapshot.hasError) {
              return const Center(child: Text("An error occured"));
            } else {
              return Container(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: const BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32))),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.left,
                          )),
                      const Categories(),
                      const SizedBox(height: 10),
                      Expanded(
                          child: ListView.builder(
                              itemCount: asyncSnapshot.data!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return ItemCard(
                                  name: "${asyncSnapshot.data![index].name}",
                                  price: "${asyncSnapshot.data![index].price}",
                                  imageLink:
                                      "${asyncSnapshot.data![index].imageLink}",
                                  priceSign:
                                      "${asyncSnapshot.data![index].priceSign}",
                                  brand: "${asyncSnapshot.data![index].brand}",
                                  rating: asyncSnapshot.data![index].rating,
                                  description:
                                      asyncSnapshot.data![index].description,
                                );
                              }))
                    ]),
              );
            }
          }),
      drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                bottomRight: Radius.circular(300)),
          ),
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(117, 153, 124, 248),
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    CircleAvatar(
                      child: Icon(Icons.person),
                      radius: 60,
                      backgroundColor: Colors.grey,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Malaika Gohar", style: TextStyle(fontSize: 22)),
                  ],
                ),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(Icons.content_paste_rounded),
                title: Text('My Orders'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(Icons.favorite_outline_outlined),
                title: Text('Wishlist'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(Icons.location_on_outlined),
                title: Text('Addresses'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(Icons.star_outline_sharp),
                title: Text('Vouchers'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(Icons.help_outline_outlined),
                title: Text('Help Center'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
              const ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ],
          )),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        height: 60,
        backgroundColor: Colors.white10,
        items: items,
        index: currentindex,
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    ));
  }
}
