import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/home/home_page.dart';

import '../../routes/route_helper.dart';


class SignInApp extends StatelessWidget {
  const SignInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background color to black
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 15),
                ),
                child: CircleAvatar(
                  maxRadius: 65,
                  backgroundImage: AssetImage("assets/image/png011.png"),
                  backgroundColor: Colors.transparent, // Set background color to transparent
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize:50,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Sign into your account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.white, // Set icon color
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white, // Set label text color
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white), // Set text color
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white, // Set icon color
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white, // Set icon color
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white, // Set label text color
                    ),
                  ),
                  obscureText: !_isPasswordVisible,
                  style: TextStyle(color: Colors.white), // Set text color
                ),
              ),
              SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  // Handle forgot password logic
                  print('Forgot Password tapped');
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Colors.white, // Set text color
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Container(
                width: 200,
                child: GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Sign In',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Don\'t have an account?',
                style: TextStyle(fontSize: 16, color: Colors.white), // Set text color
              ),
              SizedBox(height: 10.0),
              InkWell(
                onTap: () {
                  // Navigate to the login page
                  Get.offNamed(RouteHelper.getInitial());
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInController extends GetxController {
  bool _isPasswordVisible = false;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    update(); // Notify the widget to rebuild
  }

}

