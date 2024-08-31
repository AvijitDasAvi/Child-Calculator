import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int num1 = 0;
  int num2 = 0;
  num result = 0;

  final numberOneController = TextEditingController();
  final numberTwoController = TextEditingController();
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    numberOneController.text = num1.toString();
    numberTwoController.text = num2.toString();

    _listener = AppLifecycleListener(
      onResume: _onResume,
      onInactive: _onInactive,
      onHide: _onHide,
      onShow: _onShow,
      onPause: _onPause,
      onRestart: _onRestart,
      onDetach: _onDetach,
      onStateChange: _onStateChange,
    );
  }

  void _onResume() => print("onResume called");
  void _onInactive() => print("onInactive called");
  void _onHide() => print("onHide called");
  void _onShow() => print("onShow called");
  void _onPause() => print("onPause called");
  void _onRestart() => print("onRestart called");
  void _onDetach() => print("onDetach called");
  void _onStateChange(AppLifecycleState) {
    print("onStateChange called");
  }

  @override
  void dispose() {
    numberOneController.dispose();
    numberTwoController.dispose();
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Calculator",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CalculatorDisplay(
                hint: "Enter first number...",
                controller: numberOneController,
              ),
              const SizedBox(
                height: 15.0,
              ),
              CalculatorDisplay(
                hint: "Enter second number...",
                controller: numberTwoController,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                result.toString(),
                style: const TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          result = num.tryParse(numberOneController.text)! +
                              num.tryParse(numberTwoController.text)!;
                        });
                      },
                      child: const Icon(CupertinoIcons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          result = num.tryParse(numberOneController.text)! -
                              num.tryParse(numberTwoController.text)!;
                        });
                      },
                      child: const Icon(CupertinoIcons.minus),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          result = num.tryParse(numberOneController.text)! *
                              num.tryParse(numberTwoController.text)!;
                        });
                      },
                      child: const Icon(CupertinoIcons.multiply),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          result = num.tryParse(numberOneController.text)! /
                              num.tryParse(numberTwoController.text)!;
                        });
                      },
                      child: const Icon(CupertinoIcons.divide),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              FloatingActionButton.extended(
                onPressed: () {
                  setState(() {
                    num1 = 0;
                    num2 = 0;
                    result = 0;
                    numberOneController.clear();
                    numberTwoController.clear();
                  });
                },
                backgroundColor: Colors.red,
                label: const Text(
                  "Clear",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CalculatorDisplay extends StatelessWidget {
  const CalculatorDisplay(
      {super.key, this.hint = "Enter a number...", required this.controller});

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
          borderSide: const BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
        ),
      ),
    );
  }
}
