import 'package:flutter/material.dart';
import 'package:grocery_app/screens/otp.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var data;
  TextEditingController firstname = TextEditingController(text: '');
  TextEditingController lastname = TextEditingController(text: '');
  TextEditingController mobile = TextEditingController(text: '');
  TextEditingController address = TextEditingController(text: '');

  TextEditingController password = TextEditingController(text: '');
  Future loginMtd() async {
    //     body: {'phone': phone.text, 'password': password.text});

    if (firstname.text == "" ||
        lastname.text == "" ||
        mobile.text == "" ||
        address.text == "") {
      try {
        final response = await http.post(
            Uri.parse('http://localhost/ty_project/admin_panel/apisignup.php'),
            body: {
              "firstname": firstname.text,
              "lastname": lastname.text,
              "mobile": mobile.text,
              "address": address.text,
            });

        var data = jsonDecode(response.body);
      } catch (e) {
        print(e.toString());
      }
    }
    if (data == "Success") {
      Fluttertoast.showToast(
          msg: "Login Successfully",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.grey,
          fontSize: 25);
    } else {
      Fluttertoast.showToast(
          msg: "Login Not Successfully",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.grey,
          fontSize: 25);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/login.jpg',
              fit: BoxFit.cover,
              color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: kToolbarHeight),
                Text(
                  'Sign Up',
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 16.0),
                Text(
                  'First Name',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextField(
                  controller: firstname,
                  decoration: InputDecoration(
                    hintText: 'Enter your first name',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Last Name',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextField(
                  controller: lastname,
                  decoration: InputDecoration(
                    hintText: 'Enter your last name',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Mobile Number',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextField(
                  controller: mobile,
                  decoration: InputDecoration(
                    hintText: 'Enter your mobile number',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Address',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextField(
                  controller: address,
                  decoration: InputDecoration(
                    hintText: 'Enter your address',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    print(firstname.text);
                    print(lastname.text);
                    print(mobile.text);
                    print(address.text);
                    print(password.text);
                    //TODO: Implement sign-up logic
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpScreen(),
                        ));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.only(top: 2, bottom: 2, left: 18, right: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
