import 'package:flutter/material.dart';
import 'package:grocery_app/screens/otp.dart';
import 'package:grocery_app/styles/colors.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),
         ),
       ),
          Padding(
            padding: EdgeInsets.only(top: 50,bottom: 16,left: 16,right:16),
           
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
                  controller: _firstNameController,
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
                  controller: _lastNameController,
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
                  controller: _mobileNumberController,
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
                  controller: _addressController,
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
                  controller: _passwordController,
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
