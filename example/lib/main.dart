import 'package:flutter/material.dart';
import 'package:flight/flight.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flightPlugin = Flight();

  String authenticateResult = '';

  @override
  void initState() {
    super.initState();
  }

  void authenticate() async {
    var result = await _flightPlugin.authenticate();
    setState(() {
      authenticateResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  authenticate();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.blue,
                  child: const Text('Authenticate',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Text(authenticateResult)
            ],
          ),
        ),
      ),
    );
  }
}
