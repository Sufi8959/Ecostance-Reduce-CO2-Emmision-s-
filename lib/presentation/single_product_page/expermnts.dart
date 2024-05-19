// SliverList(
// delegate:
// SliverChildBuilderDelegate(
// (context, index) {
// final SdgElementModal
// sdgElement =
// fullFilledList[
// index];
// return Row(
// children: [
// SizedBox(
// width: Sv
//     .byWidthSize_50,
// height:
// Sv.byHeightSize_50,
// child: Image
//     .network(
// "${sdgElement.sdg.image}",
// errorBuilder: ((context, error, stackTrace) =>
// Icon(
// Icons.error_outline_outlined,
// size: Sv.byHeightSize_50,
// )),
// ),
// ),
// const SizedBox(
// width:
// 10,
// ),
// Expanded(
// child:
// Text(
// fullFilledList[index]
//     .sdg
//     .description,
// style:
// TextStyle(color: sdgElement.fulFilled ? Colors.black : Colors.grey),
// ),
// )
// ]);
// },
// childCount:
// fullFilledList
//     .length,
// )),

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../domain/home_products/modal/models.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: {
          const Marker(
              markerId: MarkerId('SomeId'),
              position: LatLng(11.404103, 75.864092),
              infoWindow: InfoWindow(title: 'The title of the marker'))
        },
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        compassEnabled: false,
        mapToolbarEnabled: false,
        myLocationButtonEnabled: false,
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
            target: LatLng(11.404103, 75.864092), zoom: 8.0),
      ),
    );
  }
}

LatLng getLatLang(LocationDetailsModal location) {
  final latArray = location.lat.split(RegExp(r"[°']"));
  final filteredLat =
      latArray.where((element) => RegExp(r"[0-9]").hasMatch(element)).toList();
  final doubleListLat = filteredLat.map((e) {
    return double.parse(e);
  }).toList();

  final longArray = location.long.split(RegExp(r"[°']"));
  final filteredLong =
      longArray.where((element) => RegExp(r"[0-9]").hasMatch(element)).toList();
  final doubleListLong = filteredLong.map((e) {
    return double.parse(e);
  }).toList();

  final lat =
      (doubleListLat[0] + (doubleListLat[1] / 60) + (doubleListLat[2] / 3600));

  final long = (doubleListLong[0] +
      (doubleListLong[1] / 60) +
      (doubleListLong[2] / 3600));

  return LatLng(lat, long);
}

//
// ListView
//     .builder(
// padding:
// EdgeInsets
//     .zero,
// itemBuilder:
// (context,
// index) {
// final location =
// productData
//     .details
//     .location[index];
// if (location
//     .degreeDecimal
//     .coordinates
//     .isNotEmpty) {
// // final latLang =
// //     getLatLang(
// //         location);
//
// final backuplat =  LatLng(
// location.degreeDecimal.coordinates[0],
// location.degreeDecimal.coordinates[1]);
// return Padding(
// padding:
// const EdgeInsets.all(
// 8.0),
// child:
// MapView(
// title: productData
//     .formalName,
// latLng: backuplat,
// ),
// );
// } else {
// return SizedBox();
// }
// },
// itemCount:
// productData
//     .details
//     .location
//     .length,
// ),
