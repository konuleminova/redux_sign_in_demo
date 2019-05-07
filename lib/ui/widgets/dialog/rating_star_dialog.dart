import 'package:flutter/material.dart';
import 'package:redux_sign_in/ui/widgets/rating_star.dart';

class RatingStarDialog extends StatelessWidget {
  final image = 'assets/img/3.jpg';
  final TextStyle subtitle = TextStyle(fontSize: 12.0, color: Colors.grey);
  final TextStyle label = TextStyle(fontSize: 14.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SizedBox(
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Thank You!",
                    style: TextStyle(color: Colors.green),
                  ),
                  Text(
                    "How do you rate our App?",
                    style: label,
                  ),
                  Divider(),
                  SizedBox(
                    child: new Container(
                      child: new TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 6,
                        decoration: InputDecoration(
                            hintText: "Write your message",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[RatingStarWidget(5, 4, 30)],
                        ),
                        SizedBox(width: 10.0),
                        CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(Icons.send),
                        ),
                      ],
                    ),
                    alignment: Alignment.centerRight,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
