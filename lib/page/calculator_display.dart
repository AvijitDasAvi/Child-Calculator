import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CalculatorDisplay(
                hint: "Enter first number...",
              ),
              SizedBox(
                height: 15.0,
              ),
              CalculatorDisplay(
                hint: "Enter second number...",
              ),
              Text(
                "0",
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(CupertinoIcons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(CupertinoIcons.minus),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(CupertinoIcons.multiply),
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(CupertinoIcons.divide),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay({super.key, this.hint = "Enter a number..."});

  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        hintText: hint,
        hintMaxLines: 1,
        hintStyle: const TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
        ),
      ),
    );
  }
}
