import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String? imageLink;
  final String? price;
  final String? description;
  final String? brand;
  final String? priceSign;
  final String? name;

  const Details(
      {Key? key,
      this.imageLink,
      this.price,
      this.description,
      this.brand,
      this.priceSign,
      this.name})
      : super(key: key);

  @override
  State<Details> createState() => _ItemPageState();
}

class _ItemPageState extends State<Details> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 214, 201, 255),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 214, 201, 255),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12)
              ],
            ),
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 280,
                        width: double.infinity,
                        child: Expanded(
                            child: Image.network(
                          widget.imageLink!,
                          fit: BoxFit.contain,
                        )),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                top: BorderSide(color: Colors.white),
                                bottom: BorderSide(
                                    color:
                                        Color.fromARGB(255, 214, 201, 255)))),
                      ),
                      Container(
                          padding: const EdgeInsets.fromLTRB(15, 20, 20, 150),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${widget.name}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "${widget.priceSign}${widget.price}",
                                    style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("Brand: ${widget.brand}"),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  const Text("Quantity:"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (numOfItems > 1) {
                                        setState(() {
                                          numOfItems--;
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      child: const Icon(
                                        Icons.remove,
                                        color:
                                            Color.fromARGB(255, 214, 201, 255),
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 214, 201, 255),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        numOfItems.toString().padLeft(2, "0"),
                                        style: const TextStyle(color: Colors.grey),
                                      )),
                                  InkWell(
                                    onTap: () {
                                      if (numOfItems > 1) {
                                        setState(() {
                                          numOfItems++;
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      child: const Icon(
                                        Icons.add,
                                        color:
                                            Color.fromARGB(255, 214, 201, 255),
                                        size: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 214, 201, 255),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Description:",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${widget.description}",
                                style: const TextStyle(
                                    wordSpacing: 6, letterSpacing: 0.8),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 20, bottom: 30),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: const Color.fromARGB(255, 214, 201, 255),
                              ),
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.shopping_cart_outlined,
                                color: Color.fromARGB(255, 214, 201, 255),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 214, 201, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                                child: const Text("BUY NOW",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            )));
  }
}
