import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  double _total = 0.0;
  double _electricBill = 0.0;
  double _naturalGasBill = 0.0;
  double _carDistance = 0.0;
  double _planeDistance = 0.0;

  void calculateCarbonFootprint() {
    // Perform the necessary calculations to determine the carbon footprint
    // based on the input values. Replace the calculations below with your own logic.

    double electricEmissionsFactor = 0.00872; // Example emissions factor for electricity
    double naturalGasEmissionsFactor = 0.0002; // Example emissions factor for natural gas
    double carEmissionsFactor = 0.002; // Example emissions factor for cars (per km)
    double planeEmissionsFactor = 0.1; // Example emissions factor for planes (per km)

    double electricFootprint = _electricBill * electricEmissionsFactor;
    double naturalGasFootprint = _naturalGasBill * naturalGasEmissionsFactor;
    double carFootprint = _carDistance * carEmissionsFactor;
    double planeFootprint = _planeDistance * planeEmissionsFactor;

    setState(() {
      _total = electricFootprint + naturalGasFootprint + carFootprint + planeFootprint;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carbon Footprint Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Electric Bill:',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _electricBill = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Natural Gas Bill:',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _naturalGasBill = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Car Distance (in km):',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _carDistance = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Plane Distance (in km):',
              style: TextStyle(fontSize: 16.0),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  _planeDistance = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: calculateCarbonFootprint,
              child: Text('Calculate Footprint'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Total Carbon Footprint:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              _total.toStringAsFixed(3), // Limit the decimal places to 3
              style: TextStyle(fontSize: 24.0, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
