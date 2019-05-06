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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              alignment: AlignmentDirectional.topCenter,
              color: Colors.white,
              child: new GestureDetector(
                child: GoogleMap(
                  gestureRecognizers: Set()
                    ..add(Factory<PanGestureRecognizer>(
                        () => PanGestureRecognizer()))
                    ..add(Factory<VerticalDragGestureRecognizer>(
                        () => VerticalDragGestureRecognizer())),
                  onTap: (LatLng location) {
                    MapDemoPage mp = new MapDemoPage();
                    mp.showMap();
                  },
                  polylines: setPolyLine(),
                  tiltGesturesEnabled: true,
                  markers: _markers,
                  onCameraMove: _onCameraMove,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition:
                      CameraPosition(target: _lastMapPositon, zoom: 12.00),
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
    points.add(new LatLng(40.3716222, 49.8555191));
    points.add(new LatLng(40.3716876, 49.8568066));
    points.add(new LatLng(40.3715487, 49.8570962));
    points.add(new LatLng(40.37114, 49.8573752));
    points.add(new LatLng(40.3705841, 49.8593278));
    points.add(new LatLng(40.3706822, 49.8598536));
    points.add(new LatLng(40.3703307, 49.8597248));
    points.add(new LatLng(40.3697095, 49.8619457));
    points.add(new LatLng(40.3726113, 49.8633726));
    points.add(new LatLng(40.3728565, 49.8640056));
    points.add(new LatLng(40.3728319, 49.8643489));
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
    points.add(new LatLng(40.3889252, 49.8692097));
    points.add(new LatLng(40.3890824, 49.8677312));
    points.add(new LatLng(40.3893602, 49.8672269));
    points.add(new LatLng(40.3896381, 49.8669748));
    points.add(new LatLng(40.3905125, 49.8668272));
    points.add(new LatLng(40.3909578, 49.8666784));
    points.add(new LatLng(40.3913542, 49.8663793));
    points.add(new LatLng(40.395158, 49.8608695));
    points.add(new LatLng(40.395784, 49.8601844));
    points.add(new LatLng(40.3969819, 49.8597782));
    points.add(new LatLng(40.4017475, 49.8579142));
    points.add(new LatLng(40.4041168, 49.8570559));
    points.add(new LatLng(40.4057263, 49.8564176));
    points.add(new LatLng(40.4044151, 49.8504175));
    points.add(new LatLng(40.4077768, 49.8489664));
    points.add(new LatLng(40.4061466, 49.8419916));
    points.add(new LatLng(40.4011973, 49.8438046));
    points.add(new LatLng(40.3998102, 49.8381073));
    points.add(new LatLng(40.3879051, 49.8307907));
    points.add(new LatLng(40.3870395, 49.8274014));
    points.add(new LatLng(40.3862378, 49.8245361));
    points.add(new LatLng(40.3829855, 49.8227876));
    points.add(new LatLng(40.3821034, 49.823067));
    points.add(new LatLng(40.3755725, 49.8241511));
    points.add(new LatLng(40.3681916, 49.8246767));
    points.add(new LatLng(40.3655927, 49.825556));
    points.add(new LatLng(40.365285, 49.8259239));
    points.add(new LatLng(40.3637677, 49.8262485));
    points.add(new LatLng(40.3647548, 49.8272409));
    points.add(new LatLng(40.364669, 49.8288394));
    points.add(new LatLng(40.3639741, 49.8308776));
    points.add(new LatLng(40.3623392, 49.8356412));
    points.add(new LatLng(40.3625239, 49.837428));
    points.add(new LatLng(40.3635376, 49.8380502));
    points.add(new LatLng(40.3646576, 49.8391231));
    points.add(new LatLng(40.3657121, 49.8403247));
    points.add(new LatLng(40.3674614, 49.8429426));
    points.add(new LatLng(40.3694662, 49.8486281));
    points.add(new LatLng(40.3693354, 49.8492075));
    points.add(new LatLng(40.3694171, 49.8498512));
    points.add(new LatLng(40.3703326, 49.8524905));
    points.add(new LatLng(40.370725, 49.8531342));
    points.add(new LatLng(40.3706105, 49.8537136));
    points.add(new LatLng(40.3707577, 49.8547221));
    points.add(new LatLng(40.371101, 49.8550869));
    points.add(new LatLng(40.3715097, 49.8551513));
    points.add(new LatLng(40.3716222, 49.8555191));

    List<Polyline> _lines = <Polyline>[
      new Polyline(
          polylineId: new PolylineId("111"),
          points: points,
          color: Colors.redAccent),
    ];
    Set<Polyline> plo = new Set();
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
