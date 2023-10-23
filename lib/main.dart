import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:test_flutter/data.dart';
import 'package:test_flutter/utils.dart';
import 'api_service.dart';
import 'drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  LocationData? userLocation;
  final MapController mapController = MapController();
  Marker? destinationMarker;
  List<LatLng> routingPoints = [];
  NeshanResponse? neshanResponse;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isSearching = false;


  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  Future<void> getUserLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    userLocation = await location.getLocation();
    mapController.move(
        LatLng(userLocation!.latitude!, userLocation!.longitude!), 18);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            onPressed: () {
              if (neshanResponse != null) {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          height: 150,
                          color: Colors.white,
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'مسیریابی ${neshanResponse!.summary}',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                  'مدت زمان رسیدن تا مقصد ${neshanResponse!.duration}'),
                              Text('فاصله تا مقصد ${neshanResponse!.distance}')
                            ],
                          ),
                        ),
                      );
                    });
              }
            },
            child: const Icon(Icons.info_outline),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            onPressed: () {
              if (userLocation != null) {
                mapController.move(
                    LatLng(userLocation!.latitude!, userLocation!.longitude!),
                    18);
              }
            },
            child: const Icon(
              Icons.location_searching_rounded,
            ),
          ),
        ],
      ),
      key: _key,
      appBar: buildAppBar(),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
            center: const LatLng(35.715298, 51.404343),
            zoom: 18,
            onLongPress: (position, location) async {
              if (userLocation == null) return;

              try {
                final result = await ApiService.getDirections(
                    LatLng(userLocation!.latitude!, userLocation!.longitude!),
                    location);

                neshanResponse = result;

                routingPoints = decodePolyline(result.points).unpackPolyline();

                setState(() {
                  destinationMarker = Marker(
                      point: location,
                      width: 24,
                      height: 24,
                      builder: (context) {
                        return const Icon(
                          Icons.location_on_outlined,
                          color: Colors.red,
                        );
                      });
                });
              } catch (e) {
                debugPrint('Error: $e');
              }
            }),
        children: [
          TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
          if (routingPoints.isNotEmpty)
            PolylineLayer(polylines: [
              Polyline(
                  points: routingPoints,
                  strokeWidth: 8,
                  color: Colors.deepOrange)
            ]),
          MarkerLayer(markers: [
            if (userLocation != null)
              Marker(
                  width: 24,
                  height: 24,
                  point:
                      LatLng(userLocation!.latitude!, userLocation!.longitude!),
                  builder: (context) {
                    return const Icon(
                      Icons.location_on,
                      color: Colors.pink,
                    );
                  }),
            if (destinationMarker != null) destinationMarker!,
          ])
        ],
      ),
      endDrawer: Drawer(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(
            children: [
              const SizedBox(
                height: 60,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white, // رنگ پس‌زمینه دراور
                  ),
                  child: Text(
                    'پروفایل',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('پروفایل'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.mode_of_travel),
                title: const Text('سفرهای شما'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.card_giftcard),
                title: const Text('هدیه شما'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.star_purple500),
                title: const Text(
                  "مکان های پر تردد",
                  style: TextStyle(color: Colors.black),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
    );
  }
  AppBar buildAppBar(){
    if (isSearching){
       return AppBar(
    
        centerTitle: true,
        title: InkWell(
            onTap: () {},
            child: const Text("Map", style: TextStyle(color: Colors.black))),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomDrawer()));
            },
            icon: const Icon(
              Icons.person,
              color: Colors.black,
              size: 26,
            )),
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
              onPressed: () => {_key.currentState!.openEndDrawer()},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 26,
              )),
        ],
      );
    }
      
  }
}
