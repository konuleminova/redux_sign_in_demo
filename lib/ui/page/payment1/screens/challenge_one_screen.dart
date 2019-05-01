import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/page/payment1/screens/blank_screen.dart';
import 'dart:ui';

import 'package:redux_sign_in/ui/page/payment1/widgets/pinnned_modal_sheet.dart';

class PaymentOneScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_PaymentOneScreenState();
  
}
class _PaymentOneScreenState extends State<PaymentOneScreen> with SingleTickerProviderStateMixin<PaymentOneScreen>
{
  AnimationController _controller;
  int _currentIndex=0;
  GlobalKey<NavigatorState>_navigatorKey=GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    _controller=BottomSheet.createAnimationController(this);
  }
  bool closed=true;
  List<String>options=["Top News","","Watch Now"];
  void pop()
  {
    if(_navigatorKey.currentState.canPop())
    {
      _navigatorKey.currentState.pop();
      return;
    }
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
         pop();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){pop();}),
          title: Text("Challenge 1"),
          centerTitle: true,
          actions: <Widget>[IconButton(icon: Icon(Icons.search), onPressed: (){})],
        ),
        body:Stack(
          children: <Widget>[
            Navigator(
              key: _navigatorKey,
              initialRoute: 'challenge1/',
              onGenerateRoute: (RouteSettings settings) {
                WidgetBuilder builder;
                switch (settings.name) {
                case 'challenge1/':
                builder = (BuildContext _) => Center(child: Text("Hello World",style: Theme.of(context).textTheme.headline,),);
                break;
                  default:
                    throw Exception('Invalid route: ${settings.name}');
                }
                return MaterialPageRoute(builder: builder, settings: settings);
              },
            ),
            closed?Container(width: 0.0,height: 0.0,):InkWell(
              onTap: (){setState(() {
                _controller.reverse();
                closed=true;
              });},
              child: ClipRect(
                child: new BackdropFilter(
                filter: new ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: new Container(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height,
                decoration: new BoxDecoration(
                color: Colors.black.withOpacity(0.1)
                ),
              ),)),
            )
          ],
        ),
        bottomNavigationBar: PinnedModalSheet(
           initialExpanded: false,
           onExpanded: (){setState(() {
             print("Expanded");
             this.closed=false;
           });},
            header: BottomAppBar(
              child: Row(
                children: List.generate(options.length, (index){
                  if(index==1)
                    {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.asset("images/img1.jpg",width: 60.0,height: 60.0,),
                      );
                    }
                    return Expanded(
                          flex: 1,
                          child: FlatButton(onPressed: (){
                            _controller.forward();
                            setState(() {
                              _currentIndex=index;
                            });
                          }, child: Container(padding: EdgeInsets.all(12.0),decoration: BoxDecoration(border: index==_currentIndex?Border(bottom: BorderSide(color: Colors.green,width: 3.0)):Border()),child: Text(options[index],style: TextStyle(inherit: true,fontSize: 16.0,fontWeight:index==_currentIndex? FontWeight.bold:FontWeight.w300),)),
                          ),
                        );}

              ),
            )),
            bottomSheet: BottomSheet(onClosing: (){
              print("Closed");
              setState(() {
              closed=true;
            });}, builder: (context){
              return Container(alignment: Alignment.center,height: 200.0,child: Wrap(children: createMenu(),spacing: 8.0,runSpacing: 4.0,direction: Axis.vertical,crossAxisAlignment: WrapCrossAlignment.center,),);
            },animationController: _controller,),
        ),
      ),
    );
  }
  void openScreen(String option){
     _controller.value=0.0;
    _navigatorKey.currentState.push(MaterialPageRoute(builder: (context)=>BlankScreen(option)));
  }
  List<Widget> createMenu(){
    if(_currentIndex==0)
      {
        return ["Top News","Travel","US","Entertainment","Business","Sports"].map((option)=>FlatButton( onPressed: () {openScreen(option);}, child: Text(option,style: Theme.of(context).textTheme.title,),)).toList();
      }
     else
       {
         return ["Entertainment","Comedy","Crime","Romance","Health","Opinion"].map((option)=>FlatButton( onPressed: () {openScreen(option);}, child: Text(option,style: Theme.of(context).textTheme.title,),)).toList();
       }
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
}