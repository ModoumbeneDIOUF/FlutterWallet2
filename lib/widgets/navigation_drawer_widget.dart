import 'package:flutter/material.dart';
import 'package:nafa_money/Screens/map/nearby_location.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:share/share.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../colors.dart';


class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
  

    return Drawer(
          
      child: Material(
        
        color: kPrimaryColor,
        child: ListView(
          children: <Widget>[
          
        
            Divider(color: Colors.white70),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 12),
                 // buildSearchField(),
                  
                  buildMenuItem(
                    text: getTranslated(context, "invite_personne")!.toString(),
                    icon: Icons.people,
                    onClicked: () async => await Share.share("https://play.google.com/store/apps/details?id=com.yewou.yoro")
                  ),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: getTranslated(context, "call_service")!.toString(),
                    icon: Icons.call,
                    onClicked: () async{
                      await FlutterPhoneDirectCaller.callNumber("771234567");
                     // bool? res = await FlutterPhoneDirectCaller.callNumber("number");
                    }
                  ),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: getTranslated(context, "see_agent_nearby")!.toString(),
                    icon: Icons.location_on,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: getTranslated(context, "verify_ceiling")!.toString(),
                    icon: Icons.share,
                 
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: getTranslated(context, "promotionel_code")!.toString(),
                    icon: Icons.code,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  const SizedBox(height: 12),
                  buildMenuItem(
                    text: getTranslated(context, "sign_out")!.toString(),
                    icon: Icons.logout,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    
    );
  }

  Widget buildHeader({
   // required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
             // CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              
            ],
          ),
        ),
      );

  
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    //Navigator.of(context).pop();

    switch (index) {
      case 0:
          print(0);
        break;
      case 1:
        
         print(1);
        break;
      case 2:
         Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NearbyLocation(),
        ));
         print(2);
        break;
      case 3:
        print(3);
        break;
      case 4:
       print(4);
        break;
    }
  }
}