import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/google_sign_in.dart';
import 'package:shop_app/screens/home_page_screen.dart';
import 'package:shop_app/screens/logged_in.dart';
import 'package:shop_app/screens/product_overview_screen.dart';
import 'package:shop_app/screens/sign_up.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MyApp());
  
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Applore Test',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange
        ),
        home: ProductsOverviewScreen(),
      ),
    );
  }
}






























// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MyShop',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//        
//       ),
//
//       home: MyHomeScreen(),
//     );
//   }
// }
//
// class MyHomeScreen extends StatelessWidget {
//   const MyHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('sss'),
//       ),
//       body: Center(
//         child: Text('Let\'s build a shop '),
//
//       ),
//     );
//   }
// }
//
