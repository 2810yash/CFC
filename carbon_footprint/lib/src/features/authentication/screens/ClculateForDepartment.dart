import 'package:flutter/material.dart';

class ClculateForDepartment extends StatefulWidget {
  const ClculateForDepartment({Key? key}) : super(key: key);

  @override
  State<ClculateForDepartment> createState() => _ClculateForDepartmentState();
}

class _ClculateForDepartmentState extends State<ClculateForDepartment> {
  double _total = 0.0;
  double _electricBill = 0.0;
  double _wastGenerated = 0.0;

  void calculateCarbonFootprint(){

    double electricEmissionsFactor = 0.00872;
    double wastEmissionFactor = 0.05;

    double electricFootprint = _electricBill * electricEmissionsFactor;
    double fromWastFootprint = _wastGenerated * wastEmissionFactor;

    setState(() {
      _total = electricFootprint + fromWastFootprint;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color textcolor = _total > 300 ? Colors.red : Colors.green;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Calculate your CarbonFootPrints"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
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
                      "${_total.toStringAsFixed(3)}",
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 45.0),
            child: Column(
              children: [
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
                    label: Text("WastGenerated"),
                    hintText: "Wast Generated (in Kg)",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _wastGenerated = double.tryParse(value) ?? 0.0;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: calculateCarbonFootprint,
                  child: Text('Calculate Footprint'),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),

                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
