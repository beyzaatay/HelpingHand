import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:screenshot/screenshot.dart';

import 'package:helpinghand/model/ad.dart';
import 'package:helpinghand/presentation/main_giris_one_screen/main_giris_one_screen.dart';

class MapScreen extends StatefulWidget {
  final List<Ad> ads;
  const MapScreen(this.ads, {Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  ScreenshotController screenshotController = ScreenshotController();
  late final List<Ad> totalAds;

  @override
  void initState() {
    totalAds = widget.ads;
    super.initState();
  }

  void _showInfoCard(Ad ad) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Location Info',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              if (ad.image != null && ad.image!.isNotEmpty)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      ad.image!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(height: 10),
              Text(
                ad.title ?? "-",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Text(
                ad.about ?? "-",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<BitmapDescriptor> customMarkerIcon(Ad ad) async {
    final result = await screenshotController.captureFromWidget(
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (ad.image?.isNotEmpty ?? false)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    ad.image!,
                    height: 80,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              SizedBox(height: 8),
              Text(
                ad.title ?? "-",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return BitmapDescriptor.fromBytes(result);
  }

  Future<Set<Marker>> createCustomMarker(List<Ad?> ads) async {
    Set<Marker> markers = {};

    for (int i = 0; i < ads.length; i++) {
      if (ads[i] == null) continue;
      final customIcon = await customMarkerIcon(ads[i]!);
      markers.add(Marker(
        icon: customIcon,
        markerId: MarkerId(ads[i]!.title!),
        position: ads[i]!.location!,
        onTap: () {
          _showInfoCard(ads[i]!);
          ;
        },
      ));
      print(markers.length);
    }
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Ad?>(
      valueListenable: adNotifier.currentAd,
      builder: (context, currentAd, _) {
        return Scaffold(
          backgroundColor: Colors.lime,
          body: FutureBuilder<Set<Marker>>(
            future: createCustomMarker(totalAds),
            builder: (context, snapshot) {
              Set<Marker> markers = snapshot.hasData ? snapshot.data! : {};

              return Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: currentAd?.location != null
                          ? LatLng(
                              currentAd!.location!.latitude,
                              currentAd.location!.longitude,
                            )
                          : LatLng(40.3506, 27.9767),
                      zoom: 10,
                    ),
                    onMapCreated: (controller) {
                      mapController = controller;
                    },
                    markers: markers,
                    /* <Marker>[
                    
                    /* if (currentAd?.location != null)
                      Marker(
                        icon: customMarkerIcon(currentAd),
                        markerId: MarkerId('0'),
                        position: currentAd!.location!,
                        onTap: () {
                          _showInfoCard(currentAd.location!);
                        },
                      )
                    else ...[
                      Marker(
                        markerId: MarkerId('1'),
                        position: LatLng(40.3506, 27.9767),
                      ),
                      Marker(
                        markerId: MarkerId('2'),
                        position: LatLng(40.341424, 27.968598),
                      ),
                      Marker(
                        markerId: MarkerId('3'),
                        position: LatLng(40.351883, 27.968490),
                      ),
                      Marker(
                        markerId: MarkerId('4'),
                        position: LatLng(40.356614, 27.968863),
                      ),
                    ]*/
                  ].toSet(), */
                  ),
                  if (snapshot.hasData == false)
                    Positioned.fill(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                ],
              );
            },
          ),
        );
      },
    );
  }
}
