import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafa_money/Screens/Reload/reload.dart';
import 'package:nafa_money/colors.dart';
import 'package:nafa_money/localization/language_constants.dart';

class TransactionDetails extends StatefulWidget {

  
  const TransactionDetails({ Key? key }) : super(key: key);

  @override
  _TransactionDetailsState createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimaryColor,
        title: Text(
          getTranslated(context, "transaction_details")!.toString(),
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
      body: Container(
        margin: EdgeInsets.only(left: 30.w, right: 10.h, top: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

                      InkWell(
                        onTap: (){
                           Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => ReloadScreen(
                                    
                                  )));
                        },
                        child: Material(
                              elevation: 7,
                              shape: CircleBorder(),
                              // shadowColor: widget.payment.color.withOpacity(0.4),
                              child: Container(
                                height: 70.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  shape: BoxShape.circle,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CircleAvatar(backgroundImage: AssetImage("assets/images/profil.jpg")  )
                                ),
                               ),
                              ),
                      ),
                            SizedBox(height: 20.h,),
                      Text(
                        "- 10000F", 
                        style: TextStyle(fontSize: 25.sp,color: Colors.black,fontWeight: FontWeight.bold),
                        )   ,
                          SizedBox(height: 20.h,),
                      Text(
                        "A Moussa Diop", 
                        style: TextStyle(fontSize: 20.sp,color: Colors.black),
                        ),  
                          SizedBox(height: 20.h,),
                      Text(
                        "Montant reçu", 
                        style: TextStyle(fontSize: 20.sp,color: Colors.black.withOpacity(0.3)),
                        ) ,   
                          SizedBox(height: 20.h,),
                      Text(
                        "100000f", 
                        style: TextStyle(fontSize: 20.sp,color: Colors.black),
                        ) , 
                          SizedBox(height: 20.h,),
                      Text(
                        "Frais", 
                        style: TextStyle(fontSize: 20.sp,color: Colors.black.withOpacity(0.3)),
                        ) , 
                          SizedBox(height: 20.h,),
                      Text(
                        "100F", 
                        style: TextStyle(fontSize: 20.sp,color: Colors.black),
                        ) ,
                          SizedBox(height: 20.h,),
                      Text(
                        "Statut", 
                        style: TextStyle(fontSize: 20.sp,color: Colors.black.withOpacity(0.3)),
                        ) ,
                          SizedBox(height: 20.h,),
                      Text(
                        "Effectué", 
                        style: TextStyle(fontSize: 20.sp,color: Colors.black),
                        ) ,
                          SizedBox(height: 20.h,),
                      Text(
                        "Date et heure", 
                        style: TextStyle(fontSize: 20.sp,color: Colors.black.withOpacity(0.3)),
                        ) ,
                          SizedBox(height: 20.h,),
                      Text(
                        "1 Oct. 2021 12:34 PM", 
                        style: TextStyle(fontSize: 20.sp,color: Colors.black),
                        ) ,

          ],
        ),
      ),
    );
  }
}