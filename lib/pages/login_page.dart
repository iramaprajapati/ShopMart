import 'package:flutter/material.dart';
import 'package:shop_mart/utilities/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = " ";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/loginImg.png", fit: BoxFit.cover),

              // ignore: prefer_const_constructors
              Text(
                "Welcome $name",
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // ignore: prefer_const_constructors
              Text(
                "Log In",
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username is required.";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password is required.";
                        } else if (value.length < 8) {
                          return "Password should be 8 character.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius:
                              BorderRadius.circular(changeButton ? 50 : 8),
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text("Login"),
                    //   style: TextButton.styleFrom(
                    //     minimumSize: Size(150, 40),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
