import 'package:address_search_field/address_search_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mapoutapp/screens/search/results/all_documents.dart';
import 'package:mapoutapp/utils/constants/activity_details.dart';
import 'package:provider/provider.dart';

Future<LatLng> _getPosition() async {
  final Location location = Location();
  if (!await location.serviceEnabled()) {
    if (!await location.requestService()) throw 'GPS service is disabled';
  }
  if (await location.hasPermission() == PermissionStatus.denied) {
    if (await location.requestPermission() != PermissionStatus.granted) {
      throw 'No GPS permissions';
    }
  }
  final LocationData data = await location.getLocation();
  return LatLng(data.latitude!, data.longitude!);
}

class ActivityDetailsScreen extends StatefulWidget {
  const ActivityDetailsScreen({super.key});

    final LatLng initialPositon = const LatLng(4, 2);

  @override
  State<ActivityDetailsScreen> createState() => _ActivityDetailsScreenState();
}

final routeProvider =
    ChangeNotifierProvider<RouteNotifier>(create: (ref) => RouteNotifier());

class _ActivityDetailsScreenState extends State<ActivityDetailsScreen> {
  final db = FirebaseFirestore.instance;
  
  final GeoMethods geoMethods = GeoMethods(
    googleApiKey: 'AIzaSyBfAd8r3nmL2sS_JrVYhL_--ZxbDoReMFI',
    language: 'es',
    countryCode: 'es',
    country: 'Spain',
    city: 'Barcelona'
  );

  late final GoogleMapController controller;
  final polylines = <Polyline>{};
  final markers = <Marker>{};
  final origCtrl = TextEditingController();
  final destCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(ActivityDetails.title, style: const TextStyle(color: Colors.black),),
        leading: IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AllDocuments()));
        },
        icon: const Icon(Icons.arrow_back, color: Color(0xFF50C3CB),),),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.38,
              child: StreamBuilder<QuerySnapshot>(
                stream: db.collection('ads').snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator());
                  } else{
                    return SizedBox(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: ListView(
                        children: snapshot.data!.docs.map((doc) {
                          return RouteSearchBox(
                            provider: routeProvider,
                            geoMethods: geoMethods,
                            originController: origCtrl,
                            destinationController: destCtrl,
                            locationSetters: [
                              LocationSetter(
                                coords: widget.initialPositon.toCoords(),
                                addressId: AddressId.origin,
                              ),
                            ],
                            child: Column(
                              children: [
                                Expanded(
                                  child: GoogleMap(
                                    compassEnabled: true,
                                    myLocationEnabled: false,
                                    myLocationButtonEnabled: false,
                                    rotateGesturesEnabled: true,
                                    zoomControlsEnabled: true,
                                    initialCameraPosition: CameraPosition(
                                      target: widget.initialPositon,
                                      zoom: 14.5,
                                    ),
                                    onMapCreated: (GoogleMapController ctrl) {
                                      controller = ctrl;
                                    },
                                    polylines: polylines,
                                    markers: markers,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                  color: Colors.green[50],
                                  height: 150.0,
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller: origCtrl,
                                        onTap: () => showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AddressSearchDialog.withProvider(
                                              provider: routeProvider,
                                              addressId: AddressId.origin,
                                            );
                                          },
                                        ),
                                      ),
                                      TextField(
                                        controller: destCtrl,
                                        onTap: () => showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AddressSearchDialog.withProvider(
                                              provider: routeProvider,
                                              addressId: AddressId.destination,
                                            );
                                          },
                                        ),
                                      ),
                                      Consumer(
                                        builder: (BuildContext context, WidgetRef ref, Widget? _) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    fullscreenDialog: true,
                                                    builder: (_) => Waypoints(geoMethods),
                                                  ),
                                                ),
                                                child: const Text('Points'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  try {
                                                    await ref.read(routeProvider).relocate(
                                                          AddressId.origin,
                                                          (await _getPosition()).toCoords(),
                                                        );
                                                  } catch (e) {
                                                    debugPrint(e.toString());
                                                  }
                                                },
                                                child: const Text('Relocate'),
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  try {
                                                    final route =
                                                        await ref.read(routeProvider).findRoute();
                                                    markers.clear();
                                                    polylines.clear();
                                                    markers.addAll([
                                                      Marker(
                                                        markerId: const MarkerId('origin'),
                                                        icon: BitmapDescriptor.defaultMarkerWithHue(
                                                          BitmapDescriptor.hueGreen,
                                                        ),
                                                        position: route.origin.coords!,
                                                      ),
                                                      Marker(
                                                        markerId: const MarkerId('dest'),
                                                        icon: BitmapDescriptor.defaultMarkerWithHue(
                                                          BitmapDescriptor.hueRed,
                                                        ),
                                                        position: route.destination.coords!,
                                                      ),
                                                    ]);
                                                    route.waypoints.asMap().forEach((key, value) {
                                                      markers.add(Marker(
                                                        markerId: MarkerId('point$key'),
                                                        icon: BitmapDescriptor.defaultMarkerWithHue(
                                                          BitmapDescriptor.hueViolet,
                                                        ),
                                                        position: value.coords!,
                                                      ));
                                                    });
                                                    setState(() {
                                                      polylines.add(Polyline(
                                                        polylineId: const PolylineId('route'),
                                                        points: route.points,
                                                        color: Colors.blue,
                                                        width: 5,
                                                      ));
                                                    });
                                                    await controller
                                                        .animateCamera(CameraUpdate.newLatLngBounds(
                                                      route.bounds,
                                                      60.0,
                                                    ));
                                                  } catch (e) {
                                                    debugPrint(e.toString());
                                                  }
                                                },
                                                child: const Text('Search'),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}