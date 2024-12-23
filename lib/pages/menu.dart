import 'package:flutter/material.dart';
import 'package:visitors_app/pages/admin.dart';
import 'package:visitors_app/pages/security.dart';

class VisitorsApp extends StatefulWidget {
  const VisitorsApp({super.key});

  @override
  State<VisitorsApp> createState() => _VisitorsAppState();
}

class _VisitorsAppState extends State<VisitorsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff63E5C5), Color(0xff14366F)],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'DIGILOG',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Welcome Back',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, top: 350, right: 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                color: Colors.white38,
              ),
              height: 500,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Left Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Admin()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white70,
                            fixedSize: Size(200, 140), // Square button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Admin Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.teal, fontSize: 20),
                          ),
                        ),
                        // Right Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Security()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white70,
                            fixedSize: Size(200, 140), // Square button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Security Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.teal, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
