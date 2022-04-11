import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:nafa_money/Screens/Dashboard/home_dashbord.dart';
import 'package:nafa_money/Screens/api/local_auth_api.dart';
import 'package:nafa_money/colors.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   
   @override
  void initState() {
   
    super.initState();
   
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: PinScreen(),
      ),
    );
  }
}

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  _PinScreenState createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {

  SharedPreferences? prefs;
   
   String? userPassword;
  var selectedindex = 0;
  String code = '';

   ProgressDialog? progressDialog ;
  
  @override
  void initState() {
    
    super.initState();
    getUserInfo();
    getLocalAuth();
  }

  getUserInfo() async {

    prefs = await SharedPreferences.getInstance();
  
    List stringListval = prefs!.getStringList('user') ?? [];

    print(stringListval); 
    
    setState(() {
      
      userPassword = stringListval[4];
    });

  }

  getLocalAuth() async {
    final isAuthenticated = await LocalAuthApi.authenticate();
    if (isAuthenticated) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeDashBord()));
    }
  }

  @override
  Widget build(BuildContext context) {

      progressDialog = ProgressDialog(context);

      progressDialog!.style(
      message: 'Connexion en cours ...',
    );
    TextStyle textStyle = TextStyle(
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black.withBlue(40),
    );

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    print("Code is $code");

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 100.h,
            width: 300.w,
            color: Colors.white,
            alignment: Alignment.center,
            
          ),
          Container(
              height: 700.h,
              width: 400.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Image.asset(
                                "assets/images/nafa_splash.jpg",
                                width: 90.w,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DigitHolder(
                              width: width,
                              index: 0,
                              selectedIndex: selectedindex,
                              code: code,
                            ),
                            DigitHolder(
                                width: width,
                                index: 1,
                                selectedIndex: selectedindex,
                                code: code),
                            DigitHolder(
                                width: width,
                                index: 2,
                                selectedIndex: selectedindex,
                                code: code),
                            DigitHolder(
                                width: width,
                                index: 3,
                                selectedIndex: selectedindex,
                                code: code),
                          ],
                        )),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        "Votre code secret est requis pour \n                  déverrouiller",
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          height: double.maxFinite,
                                          onPressed: () {
                                            addDigit(1);
                                          },
                                          child: Text('1', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          height: double.maxFinite,
                                          onPressed: () {
                                            addDigit(2);
                                          },
                                          child: Text('2', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          height: double.maxFinite,
                                          onPressed: () {
                                            addDigit(3);
                                          },
                                          child: Text('3', style: textStyle)),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          height: double.maxFinite,
                                          onPressed: () {
                                            addDigit(4);
                                          },
                                          child: Text('4', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          height: double.maxFinite,
                                          onPressed: () {
                                            addDigit(5);
                                          },
                                          child: Text('5', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          height: double.maxFinite,
                                          onPressed: () {
                                            addDigit(6);
                                          },
                                          child: Text('6', style: textStyle)),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          height: double.maxFinite,
                                          onPressed: () {
                                            addDigit(7);
                                          },
                                          child: Text('7', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          height: double.maxFinite,
                                          onPressed: () {
                                            addDigit(8);
                                          },
                                          child: Text('8', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          height: double.maxFinite,
                                          onPressed: () {
                                            addDigit(9);
                                          },
                                          child: Text('9', style: textStyle)),
                                    ),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: FlatButton(
                                            height: double.maxFinite,
                                            onPressed: () async {},
                                            child: Text("Oublié?"))),
                                    Expanded(
                                      flex: 1,
                                      child: FlatButton(
                                          height: double.maxFinite,
                                          onPressed: () {
                                            addDigit(0);
                                          },
                                          child: Text('0', style: textStyle)),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: code.length > 0
                                          ? FlatButton(
                                              height: double.maxFinite,
                                              onPressed: () {
                                                backspace();
                                              },
                                              child: Icon(
                                                  Icons.backspace_outlined,
                                                  color:
                                                      Colors.black.withBlue(40),
                                                  size: 30.w))
                                          : FlatButton(
                                              height: double.maxFinite,
                                              onPressed: () async {
                                                final isAuthenticated =
                                                    await LocalAuthApi
                                                        .authenticate();

                                                if (isAuthenticated) {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomeDashBord()));
                                                }
                                              },
                                              child: Icon(Icons.fingerprint,
                                                  color:
                                                      Colors.black.withBlue(40),
                                                  size: 30.w)),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  addDigit(int digit) {
    if (code.length > 3) {
      return;
    }
    setState(() {
      code = code + digit.toString();
      print('Code is $code');
      selectedindex = code.length;

      if (selectedindex == 4) {
        
        print("bien");
        print('Code is $code');
        
        if (code == userPassword) {
          progressDialog!.show();
           Future.delayed(Duration(seconds: 3)).then((value) {
                            progressDialog!.hide().then((value) => Navigator.pushReplacement(
                                   context,
                                         MaterialPageRoute(builder: (context) => HomeDashBord()),
                              ));
                          });
          
        } else {
           progressDialog!.show();
           Future.delayed(Duration(seconds: 3)).then((value) {
                            progressDialog!.hide().then((value) {

                              Toast.show("Mot de passe incorrect", context,
                              duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);

                            } );
                          });
          
          

          setState(() {
            code = code.substring(0, code.length - 4);
            selectedindex = code.length;

            print(selectedindex + 1);
          });
        }
      }
    });
  }

  backspace() {
    if (code.length == 0) {
      return;
    }
    setState(() {
      code = code.substring(0, code.length - 1);
      selectedindex = code.length;

      print(selectedindex + 1);
    });
  }
}

class DigitHolder extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String code;
  const DigitHolder({
    required this.selectedIndex,
    required this.width,
    required this.index,
    required this.code,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 15.h,
      width: 15.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: index == selectedIndex ? Colors.blue : Colors.blueAccent,
              // offset: Offset(0, 0),
              // spreadRadius: 1.5,
              blurRadius: 2,
            )
          ]),
      child: code.length > index
          ? Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
            )
          : Container(),
    );
  }
}
