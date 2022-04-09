import 'package:flutter/material.dart';
//
class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  List<String> Category = ["Cosmetics","Bags & Wallets","Jewellery","Watches","Sunglasses","Hats & Caps"];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
      padding: const EdgeInsets.fromLTRB(10, 8, 0, 2),
      height: 35,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50)
      ),
      child: ListView.builder(
          shrinkWrap: false,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return buildCategory(index);
          }
      ),
    );
  }

  Widget buildCategory(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex=  index;
        });
      },
      child: Padding(
          padding: EdgeInsets.fromLTRB(0,0,MediaQuery.of(context).size.width/9,0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Category[index],style: TextStyle(fontWeight: FontWeight.bold,
                  color: selectedIndex == index? Colors.black: Colors.grey),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  height: 2,
                  width: 30,
                  color: selectedIndex == index? Colors.black: Colors.transparent
              )
            ],
          )
      ),
    );
  }
}

