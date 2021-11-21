import 'package:flutter/material.dart';
import 'package:forecast/data/models/place_search_result_model.dart';
import 'package:forecast/presentation/providers/location_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class ForecastMap extends StatefulWidget {
  final Place? place;
  ForecastMap({this.place});

  @override
  _ForecastMapState createState() => _ForecastMapState();
}

class _ForecastMapState extends State<ForecastMap> {
  List<Marker> markers = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Selector<LocationProvider, bool>(
          selector: (context, model) => model.isPermissionGranted,
          builder: (context, permissionGranted, _) {
            if (permissionGranted == false) {
              return Container();
            }
            return GoogleMap(
              markers: markers.toSet(),
              onMapCreated: (controller) async {
                LocationData? locationData;
                if (widget.place == null) {
                  locationData = await Provider.of<LocationProvider>(context,
                          listen: false)
                      .getLocation();
                }

                if (locationData != null) {
                  controller.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(
                              locationData.latitude!, locationData.longitude!),
                          zoom: 10.4747)));
                  setState(() {
                    markers = [
                      Marker(
                          markerId: MarkerId("location"),
                          position: LatLng(
                              locationData!.latitude!, locationData.longitude!))
                    ];
                  });
                } else if (widget.place != null) {
                  controller.animateCamera(CameraUpdate.newCameraPosition(
                      CameraPosition(
                          target: LatLng(widget.place!.geometry.location.lat,
                              widget.place!.geometry.location.lng),
                          zoom: 10.4747)));
                  setState(() {
                    markers = [
                      Marker(
                          markerId: MarkerId("location"),
                          position: LatLng(widget.place!.geometry.location.lat,
                              widget.place!.geometry.location.lng))
                    ];
                  });
                }
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(37.42796133580664, -122.085749655962),
                zoom: 10.4746,
              ),
              scrollGesturesEnabled: false,
              zoomControlsEnabled: false,
            );
          },
        ),
      ),
    );
  }
}
