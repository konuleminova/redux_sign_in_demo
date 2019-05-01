import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoder/geocoder.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  _GoogleMapPageState createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
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
                decoration: new InputDecoration(hintText: "Search Adress",border: InputBorder.none,),
              ),
            )),
        new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          alignment: AlignmentDirectional.topCenter,
          child: GoogleMap(
              markers: _markers,
              onCameraMove: _onCameraMove,
              onMapCreated: _onMapCreated,
              initialCameraPosition:
                  CameraPosition(target: _lastMapPositon, zoom: 14.00)),
          margin: EdgeInsets.only(left: 16, right: 16,bottom: 20),
        ),
      ],
    );
  }

  _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
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
}
