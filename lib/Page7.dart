import 'package:feedback_app/Page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class TextPage extends StatelessWidget {
  double score;
  String data = "";
  MaterialColor col = Colors.red;
  var _textDisplay = [
    "We are sorry for your inconvenience",
    "Hope we serve you better next time",
    "We hope you come back next time"
  ];

  void textSetter(double score) {
    if (score <= 10) {
      data = _textDisplay[0];
      col = Colors.red;
    } else if (score <= 20) {
      data = _textDisplay[1];
      col = Colors.yellow;
    } else {
      data = _textDisplay[2];
      col = Colors.green;
    }
  }

  TextPage({Key? key, required this.score}) : super(key: key) {
    textSetter(score);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FEEDBACK APP"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data,
                style: TextStyle(
                  fontSize: 30,
                  color: col,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Page1()));

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Page1()),
                    // );

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Page1()),
                        (route) => false);
                  },
                  child: Text("Start Again"))
            ],
          ),
        ),
      ),
    );
  }
}
