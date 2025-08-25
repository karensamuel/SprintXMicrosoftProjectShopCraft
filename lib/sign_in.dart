import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar:AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ) ,
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
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 400,
              ),
              margin: EdgeInsets.only(right: 20,left: 20,bottom: 20,top:100),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),

              ),
              child: Column(
                children: [
                  const Text("Welcome Back",style: TextStyle(color: Colors.purple,fontSize: 25,fontWeight: FontWeight.bold)),
                  const Text("Sign in to ShopCraft",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold)),
                  Form(
                    key: _formKey,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: emailController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Email";
                            }
                            if(!value.contains("@")){
                              return "Please Enter Valid Email";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              "Email",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: Icon(Icons.mail),
                            hint:Text("Enter Email"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),

                          ),

                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          obscureText: !passVisible,
                          controller: passController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Password";
                            }
                            if(value.length<6){
                              return "Password must be at least 6 characters";
                            }
                            return null;},
                          decoration: InputDecoration(


                            label: Text(
                              "Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(onPressed: () {
                              setState(() {
                                passVisible = !passVisible;
                              });
                            }, icon: Icon(passVisible?Icons.visibility:Icons.visibility_off),),
                            hint:Text("Enter Password"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),

                          ),

                        ),
                        SizedBox(height: 20,),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            width: double.infinity,

                            child: ElevatedButton(onPressed: (){
                              if(_formKey.currentState!.validate()){
                                showDialog(
                                    builder: (context) {
                                      return AlertDialog(
                                          title: Text("Welcome!",style: TextStyle(color: Colors.purple)),
                                          content: Text("Account sign-in successfully"),
                                          actions: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: ElevatedButton(onPressed: (){
                                                Navigator.of(context).pushReplacement(PageRouteBuilder(
                                                  transitionDuration: Duration(seconds: 1),
                                                  pageBuilder: (context, animation1, animation2) => HomeScreen(),
                                                  transitionsBuilder: (context, animation1, animation2, child) {
                                                    return FadeTransition(
                                                      opacity: animation1,
                                                      child: child,
                                                    );
                                                  }

                                                ));

                                             }, child: Text("Close")),
                                            )
                                          ]
                                      );
                                    }, context: context
                                );

                              }
                            }, style:ElevatedButton.styleFrom(

                              backgroundColor: Colors.purple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))),
                          ),
                        )
                      ],
                    ),

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
