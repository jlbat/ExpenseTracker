import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0x212121FF),
              Color(0x616161FF),
              Color(0x9E9E9EFF)
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80,),
            const Padding(padding: EdgeInsets.only(left: 20, bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Login", style: TextStyle(color: Colors.white, fontSize: 50),),
                  SizedBox(height: 10,),
                  Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 20),),
                ]
              ),
            ),
            Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 100,),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(97, 97, 255, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )],
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextFormField(
                              style: const TextStyle(color: Color(0x9E9E9EFF)),
                              cursorColor: const Color(0x9E9E9EFF),
                              decoration: const InputDecoration(
                                  labelText: 'Enter your username : ',
                                  labelStyle: TextStyle(color: Color(0x9E9E9EFF))
                              ),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                  color: Color.fromRGBO(97, 97, 255, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )],
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextFormField(
                              style: const TextStyle(color: Color(0x9E9E9EFF)),
                              cursorColor: const Color(0x9E9E9EFF),
                              decoration: const InputDecoration(
                                  labelText: 'Enter your Password : ',
                                  labelStyle: TextStyle(color: Color(0x9E9E9EFF))
                              ),
                            ),
                          ),
                          const SizedBox(height: 15,),
                          TextButton(onPressed: (){}, child: const Text('Forgot Password', style: TextStyle(color: Color(0x9E9E9EFF)))),
                          const SizedBox(height: 20,),
                          AnimatedContainer(
                            duration: const Duration(seconds: 2),
                            width: 250,
                            height: 55,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            child: Material(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.deepPurple,
                              child: InkWell(
                                onTap: () {},
                                child: Center(
                                  child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 100,),

                        ],
                      ),
                    )
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}