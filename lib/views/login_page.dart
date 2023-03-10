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
        centerTitle: true,
        title: Text("Login/Sign In"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextField(
            //   decoration: InputDecoration(
            //     labelText: 'Username',
            //     prefixIcon: Icon(Icons.people)
            //   ),
            // ),
            // TextField(
            //   decoration: InputDecoration(
            //       labelText: 'Password',
            //       prefixIcon: Icon(Icons.lock)
            //   ),
            // ),
            // SizedBox(height: 20.0,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
                minimumSize: Size(double.infinity, 50),
              ),
              icon: FaIcon(FontAwesomeIcons.google, color: Colors.blue),
              label: Text('Sign in with Google'),
              onPressed: () {
                final provider = Provider.of<GoogleSignInAndLogin>(context, listen: false);
                provider.googleLogin();
              },
            ),
          ],
        )
      ),
    );
  }
}