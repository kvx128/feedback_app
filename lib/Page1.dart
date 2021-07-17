import 'package:feedback_app/Page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  double _currentRating = 0;
  MaterialColor _activeSliderColor = Colors.red;
  MaterialColor _inactiveSliderColor = Colors.purple;
  double score = 0;

  void colorSetter(double rating) {
    if (rating < 5) {
      _activeSliderColor = Colors.red;
    } else if (rating < 10) {
      _activeSliderColor = Colors.yellow;
    } else {
      _activeSliderColor = Colors.green;
    }
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
                "How did you like our Service?",
                style: TextStyle(
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Slider(
                activeColor: _activeSliderColor,
                inactiveColor: _inactiveSliderColor,
                value: _currentRating,
                min: 0,
                max: 15,
                divisions: 5,
                label: (_currentRating.round() / 3).toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentRating = value;
                    colorSetter(_currentRating);
                    score = score + value / 3;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Page2(
                                score: score,
                              )),
                    );
                  },
                  child: Text("Next"))
            ],
          ),
        ),
      ),
    );
  }
}
