import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double _total = 0.0;
  double _electricBill = 0.0;
  double _naturalGasBill = 0.0;
  double _carDistance = 0.0;
  double _planeDistance = 0.0;

  void calculateCarbonFootprint() {
    double electricEmissionsFactor = 0.00872;
    double naturalGasEmissionsFactor = 0.0002;
    double carEmissionsFactor = 0.002;
    double planeEmissionsFactor = 0.1;

    double electricFootprint = _electricBill * electricEmissionsFactor;
    double naturalGasFootprint = _naturalGasBill * naturalGasEmissionsFactor;
    double carFootprint = _carDistance * carEmissionsFactor;
    double planeFootprint = _planeDistance * planeEmissionsFactor;

    setState(() {
      _total = electricFootprint +
          naturalGasFootprint +
          carFootprint +
          planeFootprint;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color textcolor = _total > 20 ? Colors.red : Colors.green;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Calculate your CarbonFootPrints"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50.0,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Generated CarbonFootPrint: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 50.0,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      _total.toStringAsFixed(3),
                      style: TextStyle(
                        color: textcolor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 45.0),
            child: Column(children: [
              Text(
                "Enter your details here".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("ElectricBill"),
                  hintText: "Enter your Electric Bill",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                ),
                onChanged: (value) {
                  setState(() {
                    _electricBill = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("GasBill"),
                  hintText: "Enter your Gas Bill",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                ),
                onChanged: (value) {
                  setState(() {
                    _naturalGasBill = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("DrivingDistance"),
                  hintText: "How Much Km's You Drove ?",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                ),
                onChanged: (value) {
                  setState(() {
                    _carDistance = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text("Flights"),
                  hintText: "Number of flights you have taken ?",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.5),
                ),
                onChanged: (value) {
                  setState(() {
                    _planeDistance = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: ElevatedButton(
                  onPressed: calculateCarbonFootprint,
                  child: Text('Calculate Footprint'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                ),
              )
            ]),
          ),
        ]),
      ),
    );
  }
}
