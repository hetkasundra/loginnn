import 'package:flutter/material.dart';
import 'package:loginnn/screens/homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left:35,top: 130),

                  child: Text('welcome\nback',style: TextStyle(
                    color: Colors.white, fontSize: 33),),
                ),

              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,
                      right:35,
                      left: 35),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'email',
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'password',
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                      SizedBox(height: 40,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sign In',style: TextStyle(
                            color: Color(0xff4c505b),
                            fontSize: 27, fontWeight: FontWeight.w700),),


                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xff4c505b),
                          child:
                          IconButton(
                            color: Colors.white ,
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                              },
                           icon: Icon(Icons.arrow_forward),
                          ),
                        )
                        ],
                      ),
                      SizedBox(height: 40,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          TextButton(onPressed: (){
                            Navigator.pushNamed(context, 'register');
                          }, child: Text("Sign Up",style: TextStyle(
                            color: Color(0xff4c505b),
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                          ),)),
                          TextButton(onPressed: (){}, child: Text("Forgot Password",style: TextStyle(
                            color: Color(0xff4c505b),
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                          ),))
                        ],
                      )
                    ],
                  ),
                ),
              )


            ],
          ),
        ),

      );

  }
}
