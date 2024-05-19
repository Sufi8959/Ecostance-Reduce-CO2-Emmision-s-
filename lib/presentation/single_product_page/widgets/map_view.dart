// // import 'dart:async';

// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';

// // import '../../resources/color.dart';

// // class MapView extends StatefulWidget {
// //   const MapView({
// //     Key? key,
// //     required this.latLngList,
// //     this.title,
// //   }) : super(key: key);

// //   final List<LatLng?> latLngList;
// //   final String? title;

// //   @override
// //   State<MapView> createState() => _MapViewState();
// // }

// // class _MapViewState extends State<MapView> {
// //   final Completer<GoogleMapController> _controller = Completer();

// //   final Set<Marker> markers = {};

// //   @override
// //   void initState() {
// //     print(widget.latLngList);
// //     for (var element in widget.latLngList) {
// //       if (element != null) {
// //         markers.add(Marker(
// //             markerId: MarkerId(
// //               "${element.latitude}${element.longitude}",
// //             ),
// //             position: LatLng(element.latitude, element.longitude)));
// //       }
// //     }
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return markers.isNotEmpty
// //         ? Container(
// //             color: AppColors.lightGrey,
// //             child: GoogleMap(
// //               markers: markers,
// //               onMapCreated: (GoogleMapController controller) async {
// //                 _controller.complete(controller);
// //                 if (_bounds(markers) != null) {
// //                   controller.animateCamera(
// //                       CameraUpdate.newLatLngBounds(_bounds(markers)!, 140));
// //                 }
// //               },
// //               zoomControlsEnabled: true,
// //               zoomGesturesEnabled: true,
// //               tiltGesturesEnabled: true,
// //               compassEnabled: false,
// //               mapToolbarEnabled: true,
// //               myLocationButtonEnabled: false,
// //               mapType: MapType.normal,
// //               initialCameraPosition:
// //                   CameraPosition(target: LatLng(0.1, 0.1), zoom: 1.0),
// //             ),
// //           )
// //         : Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: const [
// //               Text("No Location Data Found"),
// //             ],
// //           );
// //   }

// //   LatLngBounds? _bounds(Set<Marker> markers) {
// //     if (markers.isEmpty) return null;
// //     return _createBounds(markers.map((m) => m.position).toList());
// //   }

// //   LatLngBounds _createBounds(List<LatLng> positions) {
// //     final southwestLat = positions.map((p) => p.latitude).reduce(
// //         (value, element) => value < element ? value : element); // smallest
// //     final southwestLon = positions
// //         .map((p) => p.longitude)
// //         .reduce((value, element) => value < element ? value : element);
// //     final northeastLat = positions.map((p) => p.latitude).reduce(
// //         (value, element) => value > element ? value : element); // biggest
// //     final northeastLon = positions
// //         .map((p) => p.longitude)
// //         .reduce((value, element) => value > element ? value : element);
// //     return LatLngBounds(
// //         southwest: LatLng(southwestLat, southwestLon),
// //         northeast: LatLng(northeastLat, northeastLon));
// //   }
// // }

// // //
// // // const Marker(
// // // markerId: MarkerId(
// // // "1",
// // // ),
// // // position: LatLng(21.040147585139174, 77.92915653517949)),
// // // const Marker(
// // // markerId: MarkerId(
// // // "2",
// // // ),
// // // position: LatLng(36.017279274187096, -85.1682531751334))

// // new code

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import '../../resources/color.dart';

// class MapView extends StatefulWidget {
//   const MapView({
//     Key? key,
//     required this.latLngList,
//     this.title,
//   }) : super(key: key);

//   final List<LatLng?> latLngList;
//   final String? title;

//   @override
//   State<MapView> createState() => _MapViewState();
// }

// class _MapViewState extends State<MapView> {
//   final Completer<GoogleMapController> _controller = Completer();

//   final Set<Marker> markers = {};

//   bool isMapInitialized = false;

//   @override
//   void initState() {
//     print(widget.latLngList);
//     for (var element in widget.latLngList) {
//       if (element != null) {
//         markers.add(Marker(
//             markerId: MarkerId(
//               "${element.latitude}${element.longitude}",
//             ),
//             position: LatLng(element.latitude, element.longitude)));
//       }
//     }
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return markers.isNotEmpty
//         ? LayoutBuilder(
//             builder: (context, constraints) {
//               return Container(
//                 color: AppColors.lightGrey,
//                 child: GoogleMap(
//                   markers: markers,
//                   onMapCreated: (GoogleMapController controller) async {
//                     _controller.complete(controller);
//                     isMapInitialized = true;
//                     if (markers.isNotEmpty && isMapInitialized) {
//                       final width = constraints.maxWidth;
//                       final height = constraints.maxHeight;
//                       _setCameraPosition(controller, width, height);
//                     }
//                   },
//                   zoomControlsEnabled: true,
//                   zoomGesturesEnabled: true,
//                   tiltGesturesEnabled: true,
//                   compassEnabled: false,
//                   mapToolbarEnabled: true,
//                   myLocationButtonEnabled: false,
//                   mapType: MapType.normal,
//                   initialCameraPosition:
//                       CameraPosition(target: LatLng(0.1, 0.1), zoom: 1.0),
//                 ),
//               );
//             },
//           )
//         : Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Text("No Location Data Found"),
//             ],
//           );
//   }

//   // void _setCameraPosition(
//   //     GoogleMapController controller, double width, double height) {
//   //   if (_bounds(markers) != null) {
//   //     controller.animateCamera(CameraUpdate.newLatLngBounds(
//   //         _bounds(markers)!, 140, width.toInt(), height.toInt()));
//   //   }
//   // }

//   void _setCameraPosition(
//       GoogleMapController controller, double width, double height) {
//     if (_bounds(markers) != null) {
//       controller
//           .animateCamera(CameraUpdate.newLatLngBounds(_bounds(markers)!, 140));
//     }
//   }

//   LatLngBounds? _bounds(Set<Marker> markers) {
//     if (markers.isEmpty) return null;
//     return _createBounds(markers.map((m) => m.position).toList());
//   }

//   LatLngBounds _createBounds(List<LatLng> positions) {
//     final southwestLat = positions.map((p) => p.latitude).reduce(
//         (value, element) => value < element ? value : element); // smallest
//     final southwestLon = positions
//         .map((p) => p.longitude)
//         .reduce((value, element) => value < element ? value : element);
//     final northeastLat = positions.map((p) => p.latitude).reduce(
//         (value, element) => value > element ? value : element); // biggest
//     final northeastLon = positions
//         .map((p) => p.longitude)
//         .reduce((value, element) => value > element ? value : element);
//     return LatLngBounds(
//         southwest: LatLng(southwestLat, southwestLon),
//         northeast: LatLng(northeastLat, northeastLon));
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../resources/color.dart';

class MapView extends StatefulWidget {
  const MapView({
    Key? key,
    required this.latLngList,
    this.title,
  }) : super(key: key);

  final List<LatLng?> latLngList;
  final String? title;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  final Completer<GoogleMapController> _controller = Completer();

  final Set<Marker> markers = {};
  LatLng? _center;

  @override
  void initState() {
    super.initState();
    _initializeMarkers();
    _calculateCenter();
  }

  void _initializeMarkers() {
    for (var element in widget.latLngList) {
      if (element != null) {
        markers.add(
          Marker(
            markerId: MarkerId("${element.latitude}${element.longitude}"),
            position: element,
          ),
        );
      }
    }
  }

  void _calculateCenter() {
    double minLat = double.infinity;
    double maxLat = -double.infinity;
    double minLng = double.infinity;
    double maxLng = -double.infinity;

    for (var element in widget.latLngList) {
      if (element != null) {
        minLat = element.latitude < minLat ? element.latitude : minLat;
        maxLat = element.latitude > maxLat ? element.latitude : maxLat;
        minLng = element.longitude < minLng ? element.longitude : minLng;
        maxLng = element.longitude > maxLng ? element.longitude : maxLng;
      }
    }

    if (minLat != double.infinity &&
        maxLat != -double.infinity &&
        minLng != double.infinity &&
        maxLng != -double.infinity) {
      _center = LatLng((minLat + maxLat) / 2, (minLng + maxLng) / 2);
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    // You can use the position.target directly if needed
    // _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return markers.isNotEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                color: AppColors.lightGrey,
                child: GoogleMap(
                  markers: markers,
                  onMapCreated: _onMapCreated,
                  zoomControlsEnabled: true,
                  zoomGesturesEnabled: true,
                  tiltGesturesEnabled: true,
                  compassEnabled: false,
                  mapToolbarEnabled: true,
                  myLocationButtonEnabled: false,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: _center ??
                        const LatLng(45.521563,
                            -122.677433), // Default to a fallback center if no valid center is calculated
                    zoom: 6.0,
                  ),
                  onCameraMove: _onCameraMove,
                ),
              );
            },
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("No Location Data Found"),
            ],
          );
  }
}
