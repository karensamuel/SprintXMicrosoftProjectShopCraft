import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final String img;
  final String itemName;
  final String price;

  const CardItem({
    super.key,
    required this.img,
    required this.itemName,
    required this.price,
  });
  @override
  State<CardItem> createState() => _CardItem();
}

class _CardItem extends State<CardItem> {
  /*String img ="https://photos5.appleinsider.com/gallery/45240-88149-The-new-MacBook-Pro-16-inch-xl.jpg";
  String itemName ="MacBook Pro 16";
  String price ="\$2,399";*/
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
      
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4), // shadow direction
            ),
          ],
        ),
      
        child: Column(
          mainAxisSize: MainAxisSize.min,
      
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
      
                ClipRRect(  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20) ), child: Image.network(widget.img)),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.purple,
                      ),
                      child: IconButton(onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          showCloseIcon: true,
                          closeIconColor: Colors.black,
                          backgroundColor: Colors.white,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Item added to cart",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            Text("${widget.itemName} has been added to cart",style: TextStyle(color: Colors.black),)
                          ],
                        ),));
                      }, icon: Icon(Icons.shopping_cart_outlined,color: Colors.white,))),
                ),
              ],
      
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.itemName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text(widget.price,style: TextStyle(fontSize: 15,color: Colors.purple),)
                ],
              ),
            ),
      
      
      
          ],
        ),
      
      ),
    );
  }
}
