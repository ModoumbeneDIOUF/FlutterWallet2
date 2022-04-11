import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafa_money/Screens/Dashboard/home_dashbord.dart';
import 'package:nafa_money/colors.dart';


class Otp extends StatefulWidget {

  const Otp({ Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {

  
    TextEditingController _first = TextEditingController();
    TextEditingController _second = TextEditingController();
    TextEditingController _third = TextEditingController();
    TextEditingController _fourth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: GestureDetector(
              //     onTap: () => Navigator.pop(context),
              //     child: Icon(
              //       Icons.arrow_back,
              //       size: 32,
              //       color: Colors.black54,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                width: 120.w,
                height: 200.h,
                decoration: BoxDecoration(
                  //color: kPrimaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/nafa_splash.jpg',
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Enter your SMS code number",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28.h,
              ),
              Container(
                padding: EdgeInsets.all(28.w),
                decoration: BoxDecoration(
                  color:kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Container(
      width: 50.w,
      height: 80.h,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: _first,
          autofocus: true,
          onChanged: (value) {
           
          
            if (value.length == 1) {
              
              FocusScope.of(context).nextFocus();
              
            }
            if (value.length == 0 ) {
              FocusScope.of(context).previousFocus();
            }

          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.w, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.w, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    ),
         Container(
      width: 50.w,
      height: 80.h,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: _second,
          autofocus: true,
          onChanged: (value) {
           
           
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
           
            }
            if (value.length == 0 ) {
              FocusScope.of(context).previousFocus();
            }

          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    ),
         Container(
      width: 50.w,
      height: 80.h,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: _third,
          autofocus: true,
          onChanged: (value) {
           
          
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
             
            }
            if (value.length == 0 ) {
              FocusScope.of(context).previousFocus();
            }

          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    ),
         Container(
      width: 50.w,
      height: 80.h,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: _fourth,
          autofocus: true,
          onChanged: (value) {
           
           
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
           
            }
            if (value.length == 0 ) {
              FocusScope.of(context).previousFocus();
            }

          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    )
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                           
                           if(_first.text+''+_second.text+''+_third.text+''+_fourth.text == "1234"){

                                 Navigator.pushReplacement(
                                   context,
                                  MaterialPageRoute(builder: (context) => HomeDashBord()));
                           }
                         
                        },
                        style: ButtonStyle(
                          
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kPrimaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(15.w),
                          child: Text(
                            'Verify',
                            style: TextStyle(fontSize: 18.sp),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Resend New Code",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }


}
