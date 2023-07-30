import 'package:CFC/src/features/authentication/screens/Calculator.dart';
import 'package:CFC/src/features/authentication/screens/ClculateForDepartment.dart';
import 'package:CFC/src/features/authentication/screens/CalculateForCollege.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Select extends StatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  final _select = ["Individual", "Department", "College"];
  String? _selectedVal;

  @override
  void initState() {
    super.initState();
    _selectedVal = null;
  }

  @override
  Widget build(BuildContext context) {
    Widget infoTextWidget;

    if (_selectedVal == "Individual") {
      infoTextWidget = Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          "To calcualte Individuals Carbon foot prints following factors are needed: \n\n\n1. Transportation: driving, using public transportation, flying, etc.\n2. Food: eating meat vs. vegetarian/vegan, consuming products with high carbon footprints (e.g. processed foods), etc.\n3. Home energy usage: electricity consumption, heating and cooling, etc.",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      );
    }
    else if (_selectedVal == "College") {
      infoTextWidget = Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          "To calculate the carbon footprint of a college building, you would need to take into account several factors.\n\n\n1. Energy use: The amount of energy used to power the building, including heating and cooling systems, lighting, and other appliances.\n2. Transportation: The emissions associated with transportation related to the building, such as employee commuting or business travel.\n3. Waste: The amount of waste generated by the building's occupants, and the emissions associated with disposing of that waste.",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      );
    }
    else if (_selectedVal == "Department") {
      infoTextWidget = Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          "The carbon footprint of a floor in a building can be affected by the energy consumption of the floor (e.g. lighting, air conditioning, heating), and the waste generated by the occupants.\n\n\n1. Energy consumption: This includes electricity consumption for lighting, heating, and cooling, as well as the use of appliances and electronics.\n2. Water consumption: The amount of water used on a floor, including both direct usage and indirect usage (such as water used to produce food or products used on the floor).\n3. Waste generation: The amount of waste generated on the floor, including both trash and recycling.",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      );
    }
    else {
      infoTextWidget = SizedBox.shrink();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("CarbonFootPrint"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.calculate),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.black87,
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: Icon(Icons.home),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      }),
                  Text("Home", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(right: 10.0),
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       IconButton(
            //         icon: Icon(Icons.account_circle),
            //         color: Colors.white,
            //         onPressed: () {},
            //       ),
            //       Text("Profile", style: TextStyle(color: Colors.white)),
            //     ],
            //   ),
            // ),
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
        child: ListView(
          padding: EdgeInsets.only(left: 50.0, top: 20.0, right: 50.0),
          children: [
            Text(
              "About Us",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0),
            ),
            Text(
              "One person's carbon impact is a teeny tiny drop in the giant lake-sized bucket of global emissions. But! Your personal carbon footprint absolutely matters. That is Why we built this Calculator to calculate your Carbon footprints",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.green[700],fontSize: 15.0),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("Calculate Carbon Foot Print for: "),
                  DropdownButton(
                    hint: Text("Select"),
                    value: _selectedVal,
                    items: _select
                        .map((e) => DropdownMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedVal = val as String?;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: infoTextWidget,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  if (_selectedVal == _select[0]) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calculator()));
                  } else if (_selectedVal == _select[1]) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClculateForDepartment()));
                  }
                  else if(_selectedVal == _select[2]){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ClculateForCollege()));
                  }
                  else if (_selectedVal == null) {
                    Fluttertoast.showToast(
                        msg: "Please choose one of the option",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
                child: Text("Next"),
              ),
            ),
          ]
        ),
      ),
    );
  }
}