import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passVisible = false;
  bool confirmPassVisible = false;
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
                  const Text("Create Account",style: TextStyle(color: Colors.purple,fontSize: 25,fontWeight: FontWeight.bold)),
                  const Text("Join ShopCraft today",style: TextStyle(color: Colors.grey,fontSize: 15,fontWeight: FontWeight.bold)),
                  Form(
                    key: _formKey,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                        TextFormField(
                        controller: nameController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Full Name";
                            }
                            if(!value.startsWith(value[0].toUpperCase())){
                              return "Name must start with capital letter";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text(
                              "Full Name",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: Icon(Icons.person),
                            hint:Text("Enter Full Name"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),

                          ),

                        ),
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
                        TextFormField(
                          obscureText: !confirmPassVisible,
                          controller: confirmPassController,
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Password";
                            }
                            if(value.length<6){
                              return "Password must be at least 6 characters";
                            }
                            if(value!=passController.text){
                              return "Password does not match";
                            }
                            return null;},
                          decoration: InputDecoration(
                            label: Text(
                              "Confirm Password",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(onPressed: () {
                              setState(() {
                                confirmPassVisible = !confirmPassVisible;
                              });
                            }, icon: Icon(confirmPassVisible?Icons.visibility:Icons.visibility_off),),

                            hint:Text("Confirm Password"),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),

                          ),

                        )
                        ,
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
                                    title: Text("Success"),
                                    content: Text("Account created successfully"),
                                    actions: [
                                      TextButton(onPressed: (){
                                        Navigator.pushReplacementNamed(context, '/');}, child: Text("Close"))
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
                            ),child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold))),
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
