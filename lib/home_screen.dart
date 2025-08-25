import 'package:flutter/material.dart';
import 'package:shopcraft/items/card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'items/offer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
 List<String> title=["50% Off Electronics","Free Shipping Weekend","Buy 2 Get 1 Free","Student Discount","Bundle Deals"];
 List<String> subtitle =["Limited time offer on all tech gadgets","No delivery charges on orders above \$50","On selected accessories and peripherals","Extra 20% off with valid student ID","Save more when you buy complete setups"];
 List<String> trailing =["50% OFF","FREE SHIP","B2G1","20% OFF","BUNDLE"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Products",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),

        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.purple,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text("Featured Products",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: EdgeInsets.all(10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(

                  children: [


                    PageView(
                    controller: _pageController,


                    children: [
                      Stack(
                          fit: StackFit.expand,
                        children: [

                          ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network("https://www.elliptic.co/hs-fs/hubfs/Hack.png?width=1000&name=Hack.png",fit: BoxFit.cover)),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Text("Premium Laptop Collection",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))),
                        ]
                      ),
                      Stack(
                          fit: StackFit.expand,
                          children: [

                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network("https://www.intoo.com/wp-content/uploads/sites/5/2023/10/AdobeStock_622767730-scaled-e1698784783748.jpeg",fit: BoxFit.cover)),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Text("Premium Laptop Collection",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))),
                          ]
                      ),
                      Stack(
                          fit: StackFit.expand,
                          children: [

                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network("https://d1io3yog0oux5.cloudfront.net/_fe3efedf9abfe0d3341e5e572b7e3f78/adcc/db/361/2421/featured_image_article.jpg",fit: BoxFit.cover)),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Text("Professional Workspace",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))),
                          ]
                      ),
                      Stack(
                          fit: StackFit.expand,
                          children: [

                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network("https://cdn11.bigcommerce.com/s-43185/images/stencil/original/image-manager/livingroom-indirect-lighting.jpg",fit: BoxFit.cover)),
                            Align(
                                alignment: Alignment.bottomCenter,

                                child: Text("PAmbient Lighting",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))),
                          ]
                      ),
                                      ]
                  ),

                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            _pageController.previousPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
                          }, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),
                          IconButton(onPressed: (){
                            _pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.easeInOut);
                          }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,)),

                        ],
                      ),
                    ),

                ]
                ),


              ),
            ),
            const SizedBox(height: 20),
            SmoothPageIndicator(count: 4, controller: _pageController,
              effect: WormEffect(
                dotHeight: 20,
                dotWidth: 20,
                spacing: 8,
                dotColor: Colors.grey,
                activeDotColor: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            Text("Shop Our Collection",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  crossAxisCount: 2,
              childAspectRatio: 0.8,),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              children: [
                CardItem(img: "https://photos5.appleinsider.com/gallery/45240-88149-The-new-MacBook-Pro-16-inch-xl.jpg",itemName: "MacBook Pro 16", price: "\$2,399",),
                CardItem(img: "https://photos5.appleinsider.com/gallery/45240-88149-The-new-MacBook-Pro-16-inch-xl.jpg",itemName: "Wireless Headphones", price: "\$299",),
                CardItem(img: "https://photos5.appleinsider.com/gallery/45240-88149-The-new-MacBook-Pro-16-inch-xl.jpg",itemName: "Smart Watch", price: "\$399",),
                CardItem(img: "https://photos5.appleinsider.com/gallery/45240-88149-The-new-MacBook-Pro-16-inch-xl.jpg",itemName: "Designer Backpack", price: "\$129",),
                CardItem(img: "https://photos5.appleinsider.com/gallery/45240-88149-The-new-MacBook-Pro-16-inch-xl.jpg",itemName: "Premium Keyboard", price: "\$199",),
                CardItem(img: "https://photos5.appleinsider.com/gallery/45240-88149-The-new-MacBook-Pro-16-inch-xl.jpg",itemName: "Wireless Mouse", price: "\$79",),

              ],

            ),

            const SizedBox(height: 20),
            Text("Hot Offers 🔥",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ListView.builder(itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Offer( title: title[index], subtitle: subtitle[index], trailing: trailing[index],),
              );
            },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
                itemCount: title.length,
            )

          ]
        ),
      ),

    );
  }
}
