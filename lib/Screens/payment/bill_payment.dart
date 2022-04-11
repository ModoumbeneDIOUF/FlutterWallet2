
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nafa_money/colors.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillPayment extends StatefulWidget {
  final String billType;

  const BillPayment({Key? key, required this.billType})
      : super(key: key);

  @override
  _BillPaymentState createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {

  TextEditingController billnumber = TextEditingController();

  String _billnumber = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimaryColor,
        title: Text(
          widget.billType,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Container(
              padding: EdgeInsets.only(top: 2.h, left: 20.w, right: 20.w),
              child: Text(
                 getTranslated(context, "message_bill_reference").toString(),
                 style: TextStyle(fontSize: 18.sp,color: kPrimaryColor),
                )
            ),
            Container(
              padding: EdgeInsets.only(top: 20.w, left: 20.w, right: 20.w),
              child: TextField(
                controller: billnumber,
                inputFormatters: [
                  new WhitelistingTextInputFormatter(RegExp("[0-9]")),
                ],
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  // prefix: Icon(Icons.search),
                  labelText:
                      getTranslated(context, "bill_number_hint_text").toString(),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (value) {
                  setState(() {
                    _billnumber = value;
                  });
                },
              ),
            ),
            
           
            SizedBox(
                 height: 95.h
            ),
           
          ],
        ),
        Positioned(
          right: 10.w,
          left: 10.w,
          top: 700.h,
          child:  Container(
              margin: EdgeInsets.only(left: 3.h, right: 3.h),
              width: 300.w,
              height: 60.h,
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: _billnumber != "" 
                        ? kPrimaryColor
                        : Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadowColor: Colors.black,
                    elevation: 5),
                child: Text(
                  getTranslated(context, "send_button_text").toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: _billnumber != "" 
                    ? () {
                        //  Navigator.push(
                        //   context,
                        //   new MaterialPageRoute(
                        //       builder: (context) => SendAmount(
                        //           name: name.text,
                        //           number: numero,
                        //       )));
                      }
                    : null,
              ),
            ),
        )
        ],
      ),
    );
  }


  
}
