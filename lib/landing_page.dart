
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool firstImageHover = false;
  bool secondImageHover = false;
  bool signUpHover = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title:Text(
          "ShopCraft",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue, Colors.purple,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text(
              "your premium shopping experience",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click, // pointer hand on web
                  onEnter: (_) => setState(() => firstImageHover = true),
                  onExit: (_) => setState(() => firstImageHover = false),
                  child: GestureDetector(
                    onTap: () {
                      debugPrint("First container clicked!");
                      // TODO: Navigate or open something
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      height: firstImageHover ? 250 : 200,
                      width: firstImageHover ? 250 : 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: Offset(2, 4),
                          ),
                        ],
                        image: const DecorationImage(
                          image: AssetImage("assets/images/anime-night-sky-illustration.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),

                MouseRegion(
                  onEnter: (event) {
                    setState(() {
                      secondImageHover = true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      secondImageHover = false;
                    });

                  },
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    height: secondImageHover?250:200,
                    width: secondImageHover?250:200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          spreadRadius: 2,
                          offset: Offset(2, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: NetworkImage("https://yoodli.wpcomstaging.com/wp-content/uploads/2023/08/work-from-home-jobs-2.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ), duration: Duration(seconds: 1),


                  ),

                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  Navigator.pushReplacementNamed(context,'/SignIn');
                }, child: Text("Sign In"))
                ,SizedBox(width: 20,),
                MouseRegion(
                    child: ElevatedButton(onPressed: (){
                      Navigator.pushNamed(context,'/SignUp');
                    }, child: Text("Sign Up", style: TextStyle(color: Colors.purple))))
              ]
            )

            ]

        ),
      ),
    );
  }
}

