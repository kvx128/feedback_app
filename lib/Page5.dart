import 'package:flutter/material.dart';
import 'Page6.dart';

// ignore: must_be_immutable
class Page5 extends StatefulWidget {
  Page5({Key? key, required this.score}) : super(key: key);
  double score;

  @override
  _Page5State createState() => _Page5State(score);
}

class _Page5State extends State<Page5> {
  _Page5State(this.score);

  double _currentRating = 0;
  MaterialColor _activeSliderColor = Colors.red;
  MaterialColor _inactiveSliderColor = Colors.purple;
  double score;

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
                "How likely are you to recommend us to your friends?",
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
                          builder: (context) => Page6(
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
