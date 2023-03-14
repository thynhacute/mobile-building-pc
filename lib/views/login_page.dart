import 'package:flutter/material.dart';
import 'package:flutter_footer/BE/google_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/component.dart';
import '../services/remote_services.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login/Signin',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFDC5FD),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_home.jpg'), // Thay đổi đường dẫn hình ảnh tại đây
            fit: BoxFit.cover, // Thay đổi chế độ phù hợp với hình ảnh
          ),
        ),
        padding: EdgeInsets.only(left: 35, bottom: 190, right: 35),
        child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurpleAccent.withOpacity(0.1),
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 60),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: FaIcon(FontAwesomeIcons.google, color: Color(0xFF425CFF)),
                  label: Text(
                    'Sign in with Google',
                    style: TextStyle(fontSize: 21, color: Colors.white),

                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInAndLogin>(context, listen: false);
                    provider.googleLogin();
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}
