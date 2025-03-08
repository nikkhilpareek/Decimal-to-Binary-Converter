import 'package:flutter/material.dart';

class Binarymaterial extends StatefulWidget {

 const Binarymaterial({super.key});

  @override
  State<Binarymaterial> createState() => _BinarymaterialState();
}

class _BinarymaterialState extends State<Binarymaterial> {
  final border = OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(10),);
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

String binaryConv(double num) {
  if (num.isNaN || num < 0) return "Invalid input: Enter a non-negative number"; // Reject negative numbers

  int integerPart = num.truncate();
  double fractionalPart = num - integerPart;

  String integerBinary = integerPart.toRadixString(2);

  String fractionalBinary = "";
  if (fractionalPart > 0) {
    fractionalBinary = ".";
    while (fractionalPart > 0 && fractionalBinary.length < 20) {
      fractionalPart *= 2;
      if (fractionalPart >= 1) {
        fractionalBinary += "1";
        fractionalPart -= 1;
      } else {
        fractionalBinary += "0";
      }
    }
  }

  return integerBinary + fractionalBinary;
}


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Center(child: const Text(
          'Decimal to Binary Converter',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          ),
        ),
        actions: [

        ],
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$result',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: "Enter Decimal Number",
                    hintStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: const Icon(Icons.numbers), 
                    prefixIconColor: Colors.black,
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextButton(onPressed: () {
    String result = binaryConv(double.parse(textEditingController.text));
    setState(() {
      this.result = double.parse(result); // Assuming 'result' is a state variable
    });
  },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity,40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Convert'),
                ),
              ),
            ],
          ),
        )
      );
  }
}