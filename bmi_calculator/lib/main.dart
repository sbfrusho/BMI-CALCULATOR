import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  String result = "";

  void calculateBmi(){
    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;

    if(height == 0 || weight == 0){
      setState(() {
        result = "Please enter a valid height and weight";
        return;
      });
    }
    double bmi = weight / (height * height);
    setState(() {
      result = 'Your BMI: ${bmi.toStringAsFixed(2)}';
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Bmi Calculator"),
        ),
        body: Column(
          children: [
            // Text(result),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * .05,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Weight (kg)",
                  ),
                  keyboardType: TextInputType.number,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.digitsOnly,
                  // ],
                  controller: weightController,
                  
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * .05,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Height (meters)",
                  ),
                  keyboardType: TextInputType.number,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.digitsOnly
                  // ],
                  controller: heightController,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: calculateBmi,
              child: Text(
                "Submit",
                style: TextStyle(),
              ),
            ),
            Text(result),
          ],
        ),
        
      ),
    );
  }
}
