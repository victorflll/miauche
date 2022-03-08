import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:miauche/ui/styles/app_colors.dart';
import 'package:miauche/ui/widgets/app_text.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final double lat = -9.75164;
  final double lng = -36.6604;

  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(-9.75164, -36.6604),
    zoom: 14,
  );

  Set<Circle> circles = <Circle>{
    Circle(
      circleId: const CircleId("1"),
      center: const LatLng(-9.75164, -36.6604),
      radius: 7000,
      fillColor: Colors.blue.shade100.withOpacity(0.5),
      strokeColor: Colors.blue.shade100.withOpacity(0.1),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GoogleMap(
        circles: circles,
        markers: <Marker>{
          const Marker(
            position: LatLng(-9.75164, -36.6604),
            markerId: MarkerId("1"),
          ),
        },
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.darkBlue,
      title: const AppText(
        label: "Região de Atuação",
        color: Colors.white,
        fontSize: 20,
      ),
    );
  }
}
