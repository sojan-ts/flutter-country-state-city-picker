import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  var country_selected;
  var state_selected;
  var city_selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country State City Picker"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: CSCPicker(
              layout: Layout.vertical,
              onCountryChanged: (country) {
                var countryName = country.split('    ')[1];
                setState(() {
                  country_selected = countryName;
                });
              },
              onStateChanged: (state) {
                setState(() {
                  state_selected = state;
                });
              },
              onCityChanged: (city) {
                setState(() {
                  city_selected = city;
                });
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                print(
                    "Country : ${country_selected} \n State : ${state_selected} \n City : ${city_selected}");
              },
              child: Text("Show Locations"))
        ],
      ),
    );
  }
}
