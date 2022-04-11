import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nafa_money/Screens/Home/home.dart';
import 'package:nafa_money/Screens/auth/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences? prefs;
   bool haveAccount = false;

   @override
  void initState() {
   
    super.initState();
    getUserInfo();
   
  }


getUserInfo() async {
  prefs = await SharedPreferences.getInstance();
  
  List stringListval = prefs!.getStringList('user') ?? [];

   if(stringListval.isNotEmpty){
     setState(() {
       haveAccount = true;
       print(haveAccount);
      Timer(
       Duration(seconds: 5),
       ()=> Navigator.pushReplacement(
                 context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              // MaterialPageRoute(builder: (context) => haveAccount ? HomeScreen() : LoginScreen()),
       )
       );
     });
   }
   else{
     Timer(
       Duration(seconds: 5),
       ()=> Navigator.pushReplacement(
                 context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
               //MaterialPageRoute(builder: (context) => haveAccount ? HomeScreen() : LoginScreen()),
       )
       );
   }
   
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
            Image.asset("assets/images/nafa_splash.jpg",width: 150.w,)
          ],),
        ),
      ),
      
    );
  }
}

getUserLocalInfo() async {
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  List? user = localStorage.getStringList("user");
  
  return user;
}