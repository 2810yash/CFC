import 'package:CFC/src/features/authentication/screens/Select.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('CFC'),
        leading: Icon(Icons.energy_savings_leaf_rounded),
      ),
      // drawer: Drawer(
      //   backgroundColor: Colors.green,
      //   child: ListView(
      //     children: [
      //       const UserAccountsDrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.greenAccent,
      //         ),
      //         currentAccountPicture: CircleAvatar(
      //           foregroundImage: NetworkImage(
      //               "https://e7.pngegg.com/pngimages/312/283/png-clipart-man-s-face-avatar-computer-icons-user-profile-business-user-avatar-blue-face.png"),
      //         ),
      //         accountName: Text("Yash Wairagade"),
      //         accountEmail: Text("yash2810203@gmail.com"),
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text("Home"),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: Icon(Icons.bubble_chart_rounded),
      //         title: Text("About Us"),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //           leading: Icon(Icons.account_circle_rounded),
      //           title: Text("Profile"),
      //           onTap: () {}
      //         //   Navigator.push(
      //         //       context,
      //         //       MaterialPageRoute(
      //         //           builder: (context) {
      //         //             return AboutUs();
      //         //           })
      //         //   );
      //         // },
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.calculate_outlined),
        backgroundColor: Colors.lightGreen,
        foregroundColor: Colors.black87,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Select();
            }),
          );
        },
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
                    onPressed: () {},
                  ),
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
            //         icon: Icon(Icons.account_circle_rounded),
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
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Text(
                  "Home",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(children: [
                    Text(
                      "A carbon footprint is the total amount of greenhouse gases that are generated by our actions. And as aware citizens we must know our contributions in it. Hence, we have developed a carbon footprint calculator that will keep track of our carbon footprint and help us reduce it to save our environment",
                      textAlign: TextAlign.justify,
                      style:
                      TextStyle(color: Colors.green[900], fontSize: 20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Container(
                        child: Image.asset(
                          "assets/images/CarbonFP.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
