import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:nafa_money/Screens/Dashboard/home_dashbord.dart';
import 'package:nafa_money/Screens/auth/otp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nafa_money/colors.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  SharedPreferences? prefs;
    TextEditingController _firstName = TextEditingController();
    TextEditingController _lastName = TextEditingController();
    TextEditingController _cni = TextEditingController();
    TextEditingController _password = TextEditingController();

  
    String numero = "";
  @override
  void initState() {
    super.initState();
    init();

  }

  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(

          children: [
            Positioned(
              top: 70.h,
              right: -50.w,
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: kPrimaryColor
                ),
              ),
            ),
             Positioned(
              top: 10.h,
              left: -50.w,
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kPrimaryColor
                ),
              ),
            ),
            Positioned(
              top: 800.h,
              left: -50.w,
              child: Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kPrimaryColor
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: 500.w,
                  height: 850.h,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.sp,color: kPrimaryColor),
                        ),

                        // SizedBox(height: 40,),

                        // Image.asset("assets/images/nafa_splash.jpg"),

                         SizedBox(height: 20.h,),
                           Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                          width: 290.w,
                          //height: 65.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: kPrimaryColor.withAlpha(50),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _firstName,
                              cursorColor: kPrimaryColor,
                             textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                            
                              decoration: InputDecoration(
                                counter: Offstage(),
                                icon: Icon(Icons.person,color: kPrimaryColor,),
                                hintText: 'First name',
                                contentPadding: (EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h)),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                         ),
                         
                          
                           Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                          width: 290.w,
                          //height: 65.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: kPrimaryColor.withAlpha(50),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _lastName,
                              cursorColor: kPrimaryColor,
                             textInputAction: TextInputAction.next,
                              textCapitalization: TextCapitalization.words,
                             
                              decoration: InputDecoration(
                                counter: Offstage(),
                                icon: Icon(Icons.person,color: kPrimaryColor,),
                                hintText: 'Last name',
                                contentPadding: (EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h)),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                         ),

                         Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                          width: 290.w,
                          //height: 65.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: kPrimaryColor.withAlpha(50),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _cni,
                             cursorColor: kPrimaryColor,
                              keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                               inputFormatters: [
                                 new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                                       ],
                             
                              decoration: InputDecoration(
                                counter: Offstage(),
                                icon: Icon(Icons.pin_sharp,color: kPrimaryColor,),
                                hintText: 'CNI',
                                contentPadding: (EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h)),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                         ),
                          
                
                           Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                          width: 290.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: kPrimaryColor.withAlpha(50),
                          ),
                          child:IntlPhoneField(
                            searchText: "Rechercher",
                            
                      inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[0-9]")),],
                    countries: ['SN','NG', 'GH', 'BJ' 'TG', 'CI'],
                      decoration: InputDecoration(
                        counter: Offstage(),
                        labelText:getTranslated(context,"phone_hint_text").toString(),
                        labelStyle: TextStyle(
                          fontSize: 14.sp,
                        ),
                        contentPadding: (EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h)),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.sp,
                        ),
                      ),
                      initialCountryCode: 'SN', //default country code
                      onChanged: (phone) {
                        //when phone number country code is changed
                        print(phone.completeNumber); //get complete number
                        print(phone.countryCode); // get country code only
                        print(phone.number); // only phone number
                        setState(() {
                          numero = phone.completeNumber;
                        });
                      },),
                         ),

                        

                         Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                          width: 290.w,
                          //height: 65.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            color: kPrimaryColor.withAlpha(50),
                          ),
                          child: Center(
                            child: TextField(
                              controller: _password,
                              cursorColor: kPrimaryColor,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              maxLength: 4,
                              obscureText: true,
                              
                              decoration: InputDecoration(
                                counter: Offstage(),
                                icon: Icon(Icons.lock,color: kPrimaryColor,),
                                hintText: 'Password',
                                contentPadding: (EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h)),
                                border: InputBorder.none
                              ),
                            ),
                          ),
                         ),
                          SizedBox(height: 30.h,),
                        InkWell(
                          onTap: (){

                            saveLocally(_firstName.text,_lastName.text,_cni.text,numero,_password.text);
                                    Navigator.pushReplacement(
                                  context,
                                 MaterialPageRoute(builder: (context) => Otp()),
                        );
                                            },
                          borderRadius: BorderRadius.circular(30.r),
                          child: Container(
                            width: 290.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.r),
                              color: kPrimaryColor,

                            ),
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            alignment: Alignment.center,
                            child: Text(
                              "Register",
                              style: TextStyle(color: Colors.white,fontSize: 18.sp),
                              ),
                            
                          ),
                        )  

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }

  saveLocally(String firtName,String lastName,String cni,String phoneNumber,String password) async {
  
  // prefs!.setInt('integer', 21);
  // prefs!.setString('string', "Geno Tech");
  // prefs!.setDouble('double', 2.53);
  // prefs!.setBool('boolean', true);
  SharedPreferences localStorageUser = await SharedPreferences.getInstance();
  localStorageUser.setStringList('user', [firtName, lastName, cni,phoneNumber,password]);
}

}