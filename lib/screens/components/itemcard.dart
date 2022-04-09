import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marienatie/screens/details.dart';

// ignore: must_be_immutable
class ItemCard extends StatelessWidget {
  final String? name;
  final String? price;
  final String? imageLink;
  final String? priceSign;
  final String? brand;
  final String? description;
  dynamic rating;

  ItemCard(
      {Key? key,
      this.name,
      this.price,
      this.imageLink,
      this.priceSign,
      this.brand,
      this.rating = 2,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => Details(
                      imageLink: imageLink,
                      price: price,
                      name: name,
                      priceSign: priceSign,
                      description: description,
                      brand: brand))));
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              height: 100,
              width: 95,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(imageLink!), fit: BoxFit.fill),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ))),
          Expanded(
            child: Container(
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                padding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name!,
                            style: const TextStyle(
                              fontSize: 14.5,
                            ),
                          ),
                          Text(
                            brand!,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "$priceSign${price!}",
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RatingBar.builder(
                              itemSize: 20,
                              minRating: 0,
                              itemBuilder: ((context, index) =>
                                  const Icon(Icons.star, color: Colors.amber)),
                              onRatingUpdate: (rating) {
                                this.rating = rating;
                              })
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart_outlined))
                    ])),
          ),
        ]));
  }
}
