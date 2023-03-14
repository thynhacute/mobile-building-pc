import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_footer/Views/login_page.dart';
import 'package:flutter_footer/Views/component_page.dart';
import 'package:flutter_footer/Views/user_profile_page.dart';
import 'package:flutter_footer/views/category_type_page.dart';

import '../models/component.dart';
import '../services/remote_services.dart';



class HomePageDirector extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          print('State: connecting....');
          return Center(child: CircularProgressIndicator());
        }
        else if (snapshot.hasData){
          print('State: Login complete!');
          return HomePage();
        }
        else if (snapshot.hasError){
          print('State: Error!!!');
          return Center(child: Text('Login failed! Something Went Wrong!'));
        }
        else{
          print('State: Account not found!');
          return LoginPage();
        }
      },
    ),
  );
}


class HomePage extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<HomePage>{

  int _currentIndex = 0;



  final List<Widget> tabs= [
    ProductPage(),
    CategoryTypesPage(),
    UserProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentTab = ProductPage();



  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFFDC5FD),
      body:
      PageStorage(
        child: currentTab,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      if (mounted) {
                        setState(() {
                          currentTab = ProductPage();
                          _currentIndex = 0;
                        });
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.warehouse,
                          color: _currentIndex == 0 ? Colors.pink : Colors.black,
                        ),
                        Text(
                          "Storage",
                          style: TextStyle(
                            color: _currentIndex == 0 ? Colors.pink : Colors.black,
                          )
                        )
                      ],
                    ),
                  )
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          currentTab = CategoryTypesPage();
                          _currentIndex = 1;
                        });
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.category,
                          color: _currentIndex == 1 ? Colors.pink : Colors.black,
                        ),
                        Text(
                            "Category",
                            style: TextStyle(
                              color: _currentIndex == 1 ? Colors.pink : Colors.black,
                            )
                        )
                      ],
                    ),
                  )
                ],
              ),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          currentTab = UserProfilePage();
                          _currentIndex = 2;
                        });
                      }
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: _currentIndex == 2 ? Colors.pink : Colors.black,
                        ),
                        Text(
                            "Profile",
                            style: TextStyle(
                              color: _currentIndex == 2 ? Colors.pink : Colors.black,
                            )
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}