import 'package:flutter/material.dart';
import 'package:shop_mart/utilities/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/loginImg.png", fit: BoxFit.cover),

            // ignore: prefer_const_constructors
            Text(
              "Welcome to Shop Mart !",
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // ignore: prefer_const_constructors
            Text(
              "Log In",
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Enter Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: Text("Login"),
                    style: TextButton.styleFrom(
                      minimumSize: Size(150, 40),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
