import 'package:alert_banner/exports.dart';
import 'package:expense_tracker/Components/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Common/alertBanner.dart';
import './authService.dart';

class Login extends StatefulWidget {
  static String id = 'login';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: Color(0x212121FF),
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Container(
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
                      padding: const EdgeInsets.symmetric(),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                const SizedBox(height: 100,),
                                Container(
                                  padding: const EdgeInsets.all(20),
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
                                    controller: _emailController,
                                    style: const TextStyle(color: Colors.deepPurple),
                                    cursorColor: const Color(0x9E9E9EFF),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Enter your email : ',
                                        labelStyle: TextStyle(color: Colors.deepPurple)
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30,),
                                Container(
                                  padding: const EdgeInsets.all(20),
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
                                    obscureText: !isPasswordVisible,
                                    controller: _passwordController,
                                    style: const TextStyle(color: Colors.deepPurple),
                                    cursorColor: const Color(0x9E9E9EFF),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Enter your Password : ',
                                      labelStyle: const TextStyle(color: Colors.deepPurple),
                                      suffixIcon: IconButton(
                                        icon: Icon(isPasswordVisible
                                            ? Icons.visibility
                                            : Icons.visibility_off),
                                        onPressed: () {
                                          setState(
                                                () {
                                                isPasswordVisible = !isPasswordVisible;
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                TextButton(onPressed: (){}, child: const Text('Forgot Password', style: TextStyle(color: Colors.deepPurpleAccent))),
                                const SizedBox(height: 20,),
                                AnimatedContainer(
                                  duration: const Duration(seconds: 2),
                                  width: 250,
                                  height: 55,
                                  margin: const EdgeInsets.symmetric(horizontal: 50),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.deepPurple,
                                    child: InkWell(
                                      onTap: () async {
                                        final message = await AuthService().login(email: _emailController.text, password: _passwordController.text);
                                        if (message!.contains('Success')) {
                                          Navigator.pushNamed(context, Mainpage.id);
                                          
                                          showAlertBanner(
                                              context,
                                              () {},
                                              const AlertBanner(
                                                backgroundColor: Colors.green,
                                                message: "Login Successful",// Pass the desired color here
                                              ),
                                              alertBannerLocation: AlertBannerLocation.top
                                          );
                                        } else {
                                          showAlertBanner(
                                              context,
                                                  () => print(message),
                                              AlertBanner(
                                                backgroundColor: Colors.redAccent,
                                                message: message,// Pass the desired color here
                                              ),
                                              alertBannerLocation: AlertBannerLocation.top
                                          );
                                        }
                                      },
                                      child: const Center(
                                        child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20)),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 100),
                              ],
                            ),
                          )
                      ),
                    )
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}