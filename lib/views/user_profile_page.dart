import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_footer/BE/google_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class UserProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            CircleAvatar(
              radius: 40,
                backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 8),
            Text(
              'Name: ' + user.displayName!,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ' + user.email!,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                final provider = Provider.of<GoogleSignInAndLogin>(context, listen: false);
                provider.logout();
              },
              child: Text('Logout')
            )
          ],
        ),

      )
    );
  }
}