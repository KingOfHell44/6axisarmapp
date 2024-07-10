import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 98, 10, 113),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple[100],
          title: const Text(
            "Six Axis Robot Arm",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.deepPurple,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6, // Number of containers with sliders
                (index) => SliderContainer(
                    index + 1), // Generate containers dynamically
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class SliderContainer extends StatefulWidget {
  final int index;

  const SliderContainer(this.index, {Key? key}) : super(key: key);

  @override
  _SliderContainerState createState() => _SliderContainerState();
}

class _SliderContainerState extends State<SliderContainer> {
  double _currentSliderValue = 50; // Initial value for the slider

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150, // Adjusted height to accommodate slider and padding
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.deepPurple[100],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Motor ${widget.index} with Control',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: 20),
          Slider(
            value: _currentSliderValue,
            min: 0,
            max: 100,
            divisions: 10,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value; // Update the slider value
              });
            },
          ),
        ],
      ),
    );
  }
}
