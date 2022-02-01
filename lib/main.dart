import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: Homepage());
  }
}

TextEditingController altura = TextEditingController();
TextEditingController peso = TextEditingController();
double alturanumber = 0.0;
double pesonumber = 0.0;
double imc = 0.0;
bool genre = false;
Color colormale = Colors.grey.shade300;
Color colorfemale = Colors.grey.shade300;
String idealimc = '';

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Calcular IMC'),
          backgroundColor: Colors.green[400],
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              onPressed: () {
                peso.clear();
                altura.clear();
              },
            )
          ]),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Ingrese sus datos para calcular IMC')],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    genre = true;
                    colormale = Colors.blue;
                    colorfemale = Colors.grey.shade300;
                    setState(() {});
                  },
                  icon: Icon(Icons.male),
                  color: colormale,
                ),
                IconButton(
                  onPressed: () {
                    genre = false;
                    colormale = Colors.grey.shade300;
                    colorfemale = Colors.pink;
                    setState(() {});
                  },
                  icon: Icon(Icons.female),
                  color: colorfemale,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: altura,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0)),
                  border: OutlineInputBorder(),
                  labelText: 'Altura (cm)',
                  hintText: 'Ingresa tu altura',
                  icon: Icon(Icons.square_foot)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: peso,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0)),
                  border: OutlineInputBorder(),
                  labelText: 'Peso (cm)',
                  hintText: 'Ingresa tu peso',
                  icon: Icon(Icons.monitor_weight_rounded)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    primary: Colors.red, backgroundColor: Colors.grey[200]),
                onPressed: () {
                  alturanumber = double.parse(altura.text);
                  pesonumber = double.parse(peso.text);
                  imc = (pesonumber / alturanumber) / alturanumber;
                  if (genre == false) {
                    idealimc =
                        '\nTabla del IMC para mujeres\n\nEdad      IMC ideal\n16-17     19-24\n18-18       19-24\n19-24     19-24\n25-34     20-25\n35-44     21-26\n45-54     22-27\n55-64     23-28\n65-90     25-30';
                  } else {
                    idealimc =
                        '\nTabla del IMC para hombres\n\nEdad      IMC ideal\n16-16       19-24\n17-17       20-25\n18-18       20-25\n19-24     21-26\n25-34     22-27\n35-54     23-38\n55-64     24-29\n65-90     25-30';
                  }
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            children: [
                              Text(
                                'Tu IMC es: ${imc.toStringAsFixed(2)}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('$idealimc')
                            ],
                          ),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Aceptar');
                                },
                                child: Text('Aceptar')),
                          ],
                        );
                      });
                },
                child: Text(
                  'Calcular',
                  style: TextStyle(color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}
