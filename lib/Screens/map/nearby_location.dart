import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:toast/toast.dart';




class NearbyLocation extends StatefulWidget {
  const NearbyLocation({ Key? key }) : super(key: key);

  @override
  _NearbyLocationState createState() => _NearbyLocationState();
}

class _NearbyLocationState extends State<NearbyLocation> {
  
    static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];

 Position? currentPosiiton;

 Future<Position> _determinatePosition() async{

   bool serviceEnable;
   LocationPermission permission;
   
   serviceEnable = await Geolocator.isLocationServiceEnabled();
   if (!serviceEnable) {

        Toast.show("Please keep youtr location non", context,  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);  
     }
    else {
      permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied){
        permission = await Geolocator.requestPermission();

        if(permission == LocationPermission.denied){
             Toast.show("Location permission is denied", context,  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM); 
      }
   }
   if(permission == LocationPermission.deniedForever){
        Toast.show("Location permission is denied forever", context,  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM); 
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );
      try{
        List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
        Placemark place = placemarks[0];

        setState(() {
          currentPosiiton = position;
          print("current position = ${currentPosiiton!}");
        });
      }catch(e){ print(e);}
   }
   return  await  Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
      );
 }
 
  Future<String> getPhoneInfo () async{
   if (Platform.isAndroid) { 
     final info = await _deviceInfoPlugin.androidInfo;
     return '${info.manufacturer} - ${info.model}' ;
     
   } else if(Platform.isIOS) {

     final info = await _deviceInfoPlugin.iosInfo;
     return '${info.name} - ${info.model}' ;
   }
   else{
     throw UnimplementedError();
   }
 }
  @override
  void initState() {
    initialise();
    _determinatePosition();

    print("distance ${ Geolocator.distanceBetween(52.2165157, 6.9437819, 52.3546274, 4.8285838)}");
    print(getPhoneInfo.toString());
    super.initState();
    
  }

   initialise() {
      Marker firstMarker = Marker(
        markerId: MarkerId("gramercy"),
        position: LatLng(14.7522014, -17.4358181),
        infoWindow: InfoWindow(title: "Nafa "),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed
        )
        
      ); 

       Marker secondMarker = Marker(
        markerId: MarkerId("bardin"),
        position: LatLng(14.7522014,-17.4380068),
        infoWindow: InfoWindow(title: "map 2"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed
        )
        
      ); 

      Marker thirdMarker = Marker(
        markerId: MarkerId("bardin"),
        position: LatLng(14.7508861,-17.4369107),
        infoWindow: InfoWindow(title: "map 3"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed
        )
        
      );

       Marker forthdMarker = Marker(
        markerId: MarkerId("bardin"),
        position: LatLng(14.7469072,-17.4334897),
        infoWindow: InfoWindow(title: "map 3"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed
        )
        
      );

        Marker fivethdMarker = Marker(
        markerId: MarkerId("bardin"),
        position: LatLng(14.7505565,-17.4393826),
        infoWindow: InfoWindow(title: "map 3"),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed
        ),
        

      );
      
      markers.add(firstMarker); 
      markers.add(secondMarker);  
      markers.add(thirdMarker); 
      markers.add(forthdMarker);

      setState(() {
        
      }); 
   }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: Container(
        child: GoogleMap(
          mapType: MapType.normal,
          onTap: (latLng){},
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          initialCameraPosition: CameraPosition( 
            target: LatLng(14.7583922,-17.4426628111),zoom: 14
           ),

           onMapCreated: (GoogleMapController controller){
             _controller.complete(controller);
           },
           markers: markers.map((e) => e).toSet()  
       ),
      ) 
    );
  }

  
}