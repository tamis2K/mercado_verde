import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Mapas ',
          style: TextStyle(color: Colors.white),
        ),
        
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(48.8566, 2.3522), 
          zoom: 10,
        ),
      ),
      

    );
  }

  
}
