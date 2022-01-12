import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/product_overview_screen.dart';
import 'package:shop_app/screens/sign_up.dart';

import 'logged_in.dart';



class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: StreamBuilder<Object?>(

      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator()
          );

        }
        else if(snapshot.hasData) {
          // return LoggedInWidget();
          return ProductsOverviewScreen();
        }
        else if (snapshot.hasError){
          return Center (child:Text('Something'));
        }
        else{
          return SignUp();
        }

      }
    ),
    );
  }
}
