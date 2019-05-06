import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';
import 'package:redux_sign_in/ui/page/map_view.dart';

class MapPage1 extends StatefulWidget {
  @override
  _MapPage1State createState() => _MapPage1State();
}

class _MapPage1State extends State<MapPage1> {
  static const LatLng _bakuLatLng = const LatLng(40.409264, 49.867092);
  GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  LatLng _lastMapPositon = _bakuLatLng;
  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Card(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          //alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(8),
            child: new TextField(
              onSubmitted: (text) {
                return getLocations();
              },
              controller: _textEditingController,
              decoration: new InputDecoration(
                hintText: "Search Adress",
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        GestureDetector(
            child: new Container(
              padding: EdgeInsets.all(1),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.3,
              alignment: AlignmentDirectional.topCenter,
              color: Colors.white,
              child: new GestureDetector(
                child: GoogleMap(
                  gestureRecognizers: Set()
                    ..add(Factory<PanGestureRecognizer>(
                            () => PanGestureRecognizer()))..add(
                        Factory<VerticalDragGestureRecognizer>(
                                () => VerticalDragGestureRecognizer())),
                  onTap: (LatLng location) {
                    MapDemoPage mp = new MapDemoPage();
                    mp.showMap();
                  },
                  polylines:setPolyLine(),
                  tiltGesturesEnabled: true,
                  markers: _markers,
                  onCameraMove: _onCameraMove,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition:
                  CameraPosition(target: _lastMapPositon, zoom: 14.00),
                ),
                onTap: () {
                  MapDemoPage mp = new MapDemoPage();
                  mp.showMap();
                },
              ),
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
            ),
            onTap: () {
              MapDemoPage mp = new MapDemoPage();
              mp.showMap();
            }),
      ],
    );
  }

  _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  setPolyLine() {
    List<LatLng> points = new List<LatLng>();
    points.add(new LatLng(45.52309483308097, -122.67339684069155));
    points.add(new LatLng(40.3725459, 49.8645313));
    points.add(new LatLng(40.3716794, 49.8646172));
    points.add(new LatLng(40.3714996, 49.8654218));
    points.add(new LatLng(40.3716304, 49.8659475));
    points.add(new LatLng(40.3724713, 49.8659568));
    points.add(new LatLng(40.3734358, 49.8673086));
    points.add(new LatLng(40.3736156, 49.8713856));
    points.add(new LatLng(40.3746291, 49.8717075));
    points.add(new LatLng(40.3747599, 49.8793893));
    points.add(new LatLng(40.3739262, 49.8797755));
    points.add(new LatLng(40.3743022, 49.884625));
    points.add(new LatLng(40.3789773, 49.8814064));
    points.add(new LatLng(40.3843549, 49.8799043));
    points.add(new LatLng(40.3857114, 49.8798184));
    points.add(new LatLng(40.3871497, 49.8796495));
    points.add(new LatLng(40.3886207, 49.8795181));
    points.add(new LatLng(40.3889394, 49.8765355));
    points.add(new LatLng(40.3890619, 49.873467));

    List<Polyline> _lines = <Polyline>[
      new Polyline(
          polylineId:new PolylineId("112"),
          points: points, color: Colors.redAccent
      ),
    ];
    Set<Polyline> plo=new Set();
    plo.addAll(_lines);
    return plo;
  }

  void _onCameraMove(CameraPosition position) {}

  void getLocations() async {
    CameraPosition position =
    new CameraPosition(target: new LatLng(21.417276, -1.279271));
    _onCameraMove(position);
    final query = _textEditingController.text;
    var address = await Geocoder.local.findAddressesFromQuery(query);
    var first = address.first;
    setState(() {
      _lastMapPositon =
      new LatLng(first.coordinates.latitude, first.coordinates.longitude);
      _markers.add(Marker(
          draggable: true,
          markerId: MarkerId(_lastMapPositon.toString()),
          position: _lastMapPositon,
          infoWindow:
          InfoWindow(title: first.countryName, snippet: first.addressLine),
          icon: BitmapDescriptor.defaultMarker));
      _mapController.animateCamera(CameraUpdate.newCameraPosition(
          new CameraPosition(target: _lastMapPositon, zoom: 14.00)));
    });

    print(first.coordinates.toString() + " Konul...");
  }

  void _onMapTab(LatLng argument) {
    MapDemoPage mp = new MapDemoPage();
    mp.showMap();
    print("map tab");
  }
}
