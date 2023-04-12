import 'dart:async';

import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _firstController = TextEditingController();
  TextEditingController _secondController = TextEditingController();
  TextEditingController _thirdController = TextEditingController();
  TextEditingController _fourthController = TextEditingController();

  int _counter = 2;
  bool _resendButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (timer) => setState(
        () {
          if (_counter < 1) {
            timer.cancel();
            _resendButtonDisabled = false;
          } else {
            _counter = _counter - 1;
          }
        },
      ),
    );
  }

  void _onResendButtonPressed() {
    setState(() {
      _counter =2;
      _resendButtonDisabled = true;
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/images/otp_background.png',
                fit: BoxFit.cover,
                //color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
                
               
              ),
            ),
          ),
          AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.black,),
              onPressed: () => Navigator.of(context).pop(),
         ),
       ),
          Container(
        //    decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/otp_background.png"),
        //     fit: BoxFit.cover,
        //     opacity: 0.2
        //   ),
        // ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter the OTP sent to your mobile number',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _otpBox(_firstController),
                    _otpBox(_secondController),
                    _otpBox(_thirdController),
                    _otpBox(_fourthController),
                  ],
                ),
                SizedBox(height: 30.0),
                Text(
                  'Resend OTP in $_counter seconds',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: _resendButtonDisabled ? Colors.grey : Colors.green,
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: _resendButtonDisabled ? null : _onResendButtonPressed,
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        ],
      )
    );
  }

  Widget _otpBox(TextEditingController controller) {
    return SizedBox(
      width: 50.0,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counter: Offstage(),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
