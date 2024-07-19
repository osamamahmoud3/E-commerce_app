import 'package:ecommerce/core/styles/colors.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/features/google_maps/presentation/views/widgets/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../generated/l10n.dart';
import '../../../../check_out/presentation/view/widgets/address_screen_body.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  GoogleMapController? initialGoogleMapController;
  LocationService locationService = LocationService();
  @override
  void initState() {
    locationService.checkAndRequestLocationService();
    locationService.checkAndRequestLocationPermission();
    super.initState();
  }

  Set<Marker> myMarker = {};
  List<Placemark> address = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(S.of(context).Pick_Your_Location),
        ),
        body: Stack(
          children: [
            GoogleMap(
              markers: myMarker,
              onMapCreated: (controller) {
                initialGoogleMapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(0, 0),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.1,
              left: 20,
              child: FloatingActionButton(
                onPressed: () async {
                  var data = await locationService.getLocationData();
                  var locationMarker = Marker(
                      markerId: const MarkerId('1'),
                      position: LatLng(data.latitude!, data.longitude!));
                  myMarker.add(locationMarker);
                  setState(() {});
                  print(data);
                  initialGoogleMapController!.animateCamera(
                      CameraUpdate.newLatLngZoom(
                          LatLng(data.latitude!, data.longitude!), 16));
                  address = await placemarkFromCoordinates(
                      data.latitude!, data.longitude!);

                  print(address);
                },
                child: const Icon(Icons.location_searching),
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.02,
              right: 50,
              left: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    onPressed: () {
                      Navigator.pop(context);

                      setState(() {
                        location =
                            "${address[0].subAdministrativeArea} ${address[0].administrativeArea} ${address[0].country}";
                      });
                    },
                    text: Text(S.of(context).confirm),
                    bgColor: AppColors.green),
              ),
            )
          ],
        ));
  }
}
