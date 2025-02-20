import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:myapp/base/show_custom_snackbar.dart';
import 'package:myapp/pages/auth/dumb_sign_in.dart';
import 'package:myapp/pages/home/home_page.dart';
import 'package:myapp/pages/home/main_tech_page.dart';
import 'package:myapp/pages/home/tech_page_body.dart';

import '../../routes/route_helper.dart';


class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isPasswordVisible = false;
  String email = '';
  String phone = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xff000000),
    body: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              ),
              child: CircleAvatar(
                maxRadius: 65,
                backgroundImage: AssetImage("assets/image/png011.png"),
                backgroundColor: Colors.transparent,
                ),
            ),
            SizedBox(height: 20),
            Text(
              'Galaxy',
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              ),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                  email = value;
                  });
                },
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock, color: Colors.white),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                    ? Icons.visibility
                      : Icons.visibility_off,
                  color: Colors.white,
                  ),
                  onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                labelStyle: TextStyle(color: Colors.white),
              ),
                obscureText: !_isPasswordVisible,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Phone',
                prefixIcon: Icon(Icons.phone, color: Colors.white),
                labelStyle: TextStyle(color: Colors.white),
              ),
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                setState(() {
                  phone = value;
                });
              },
            ),),
            SizedBox(height: 20.0),
            Container(
            width: 200,
            child: ElevatedButton(
              onPressed: _registration,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff1DB954),
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),),
          SizedBox(height: 20.0),
          Text(
            'By signing up, you agree to our Terms of Use and Privacy Policy.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          SizedBox(height: 20.0),
            InkWell(
              onTap: () {
                // Navigate to the login page
                Get.to(HomePage());
              },
              child: Text(
                'Already signed in? Log in',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle continue with Google
                    print('Continue with Google tapped');
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/google2.png', height: 24, width: 24),
                    SizedBox(width: 10),
                    Text('Continue with Google', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
                SizedBox(height: 20.0),
                Ink(
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                    ),
                  child: InkWell(
                    onTap: () {
                      // Handle continue with Apple
                      print('Continue with Apple tapped');
                    },
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Image.asset('assets/image/applelogo.png', height: 24, width: 24),
                            SizedBox(width: 10),
                            Text('Continue with Apple', style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Ink(
                  decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  ),
                   child: InkWell(
                    onTap: () {
                      // Handle continue with Facebook
                      print('Continue with Facebook tapped');
                    },
                     borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/image/f.png', height: 30, width: 30),
                          SizedBox(width: 10),
                          Text('Continue with Facebook', style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

  void _registration() {
    if (email.isEmpty) {
    showCustomSnackBar("Type in your email", title: "E-mail");
    } else if (phone.isEmpty) {
    showCustomSnackBar("Type in your phone", title: "Phone");
    } else if (!isValidEmail(email)) {
    showCustomSnackBar("Type in a valid email address", title: "Valid e-mail address");
    } else if (password.isEmpty) {
    showCustomSnackBar("Type in your password", title: "Password");
    } else if (password.length < 6) {
    showCustomSnackBar("Password can't be less than 6 characters", title: "Password");
    } else {
      showCustomSnackBar("All went well", title: "Perfect");
    }
  }
  void performSignUp() {
    // Placeholder for actual sign-up logic
    print('Simulated sign-up: Email: $email, Phone: $phone, Password: $password');
    showCustomSnackBar("Sign-up successful!", title: "Success");
  }
  bool isValidEmail(String email) {
    // Add your email validation logic here
    return true;
    }
}
