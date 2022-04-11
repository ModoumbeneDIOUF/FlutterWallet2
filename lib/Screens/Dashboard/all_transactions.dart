import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nafa_money/localization/language_constants.dart';

import '../../colors.dart';

class AllTransactions extends StatefulWidget {
  const AllTransactions({ Key? key }) : super(key: key);

  @override
  _AllTransactionsState createState() => _AllTransactionsState();
}

class _AllTransactionsState extends State<AllTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
       backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: kPrimaryColor,
        title: Text(
          getTranslated(context, "all_transaction")!.toString(),
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
      body: 
            Container(
              margin: EdgeInsets.only(left: 10.h, right: 10.h, top: 20.h),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                      child: ListTile(
                        title: Text("Moussa Diop"),
                        subtitle: Text("Transfert Nafa"),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              Text(
                                "- 10000 FCFA",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("il ya 1 jour"),
                            ],
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.2),
                          child: Material(
                            elevation: 7,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                              height: 50.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                //child: CircleAvatar(backgroundImage: AssetImage("assets/images/nafa_splash.jpg")  )
                              ),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                      child: ListTile(
                        title: Text("Adama Séne"),
                        subtitle: Text("Transfert Nafa"),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              Text(
                                "+ 20000 FCFA",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("il ya 2 jours"),
                            ],
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.3),
                          child: Material(
                            elevation: 7,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                               height: 50.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                //child: CircleAvatar(backgroundImage: AssetImage("assets/images/orange.jpg")  )
                              ),
                            ),
                          ),
                        ),
                      )),
                      SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                      child: ListTile(
                        title: Text("Adama Séne"),
                        subtitle: Text("Transfert Nafa"),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              Text(
                                "+ 20000 FCFA",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("il ya 2 jours"),
                            ],
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.3),
                          child: Material(
                            elevation: 7,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                               height: 50.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                //child: CircleAvatar(backgroundImage: AssetImage("assets/images/orange.jpg")  )
                              ),
                            ),
                          ),
                        ),
                      )),
                      SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                      child: ListTile(
                        title: Text("Adama Séne"),
                        subtitle: Text("Transfert Nafa"),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              Text(
                                "+ 20000 FCFA",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("il ya 2 jours"),
                            ],
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.3),
                          child: Material(
                            elevation: 7,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                               height: 50.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                //child: CircleAvatar(backgroundImage: AssetImage("assets/images/orange.jpg")  )
                              ),
                            ),
                          ),
                        ),
                      )),
                      
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                      child: ListTile(
                        title: Text("Ousmane Faye"),
                        subtitle: Text("Transfert Nafa"),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              Text(
                                "- 5000 FCFA",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("il ya 4 jours"),
                            ],
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.3),
                          child: Material(
                            elevation: 7,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                               height: 50.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                // child: CircleAvatar(backgroundImage: AssetImage("assets/images/nafa_splash.jpg")  )
                              ),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                      child: ListTile(
                        title: Text("Penda Diouf"),
                        subtitle: Text("Transfert Nafa"),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              Text(
                                "+ 7000 FCFA",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("il ya 4 jours"),
                            ],
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.3),
                          child: Material(
                            elevation: 7,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                              height: 50.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                //child: CircleAvatar(backgroundImage: AssetImage("assets/images/orange.jpg")  )
                              ),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                      child: ListTile(
                        title: Text("Khadim Diop"),
                        subtitle: Text("Transfert Nafa"),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              Text(
                                "- 3000 FCFA",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("il ya 5 jours"),
                            ],
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.3),
                          child: Material(
                            elevation: 7,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                               height: 50.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                // child: CircleAvatar(backgroundImage: AssetImage("assets/images/orange.jpg")  )
                              ),
                            ),
                          ),
                        ),
                      )
                      ),
                       SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                      child: ListTile(
                        title: Text("Khadim Diop"),
                        subtitle: Text("Transfert Nafa"),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              Text(
                                "- 3000 FCFA",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("il ya 5 jours"),
                            ],
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.3),
                          child: Material(
                            elevation: 7,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                               height: 50.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                // child: CircleAvatar(backgroundImage: AssetImage("assets/images/orange.jpg")  )
                              ),
                            ),
                          ),
                        ),
                      )
                      ), SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                      child: ListTile(
                        title: Text("Abdou Faye"),
                        subtitle: Text("Transfert Nafa"),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              Text(
                                "+ 4000 FCFA",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("il ya 8 jours"),
                            ],
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.3),
                          child: Material(
                            elevation: 7,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                               height: 50.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                // child: CircleAvatar(backgroundImage: AssetImage("assets/images/orange.jpg")  )
                              ),
                            ),
                          ),
                        ),
                      )
                      ), SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              //spreadRadius: 5
                            )
                          ]),
                      child: ListTile(
                        title: Text("Amadou Sow"),
                        subtitle: Text("Transfert Nafa"),
                        trailing: Container(
                          margin: EdgeInsets.only(top: 2.h),
                          child: Column(
                            children: [
                              Text(
                                "+ 3000 FCFA",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text("il ya 10 jours"),
                            ],
                          ),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.3),
                          child: Material(
                            elevation: 7,
                            shape: CircleBorder(),
                            // shadowColor: widget.payment.color.withOpacity(0.4),
                            child: Container(
                               height: 50.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                // child: CircleAvatar(backgroundImage: AssetImage("assets/images/orange.jpg")  )
                              ),
                            ),
                          ),
                        ),
                      )
                      ),
                        SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
        
      ),
    );
  }
}