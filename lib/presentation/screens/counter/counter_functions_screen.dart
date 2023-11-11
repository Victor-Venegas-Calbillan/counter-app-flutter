import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter functions'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickCounter',
                  style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100
                  )
              ),
              Text('Click${clickCounter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25)
              )
            ],
          ),
        ),
        floatingActionButton:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.plus_one,
              onPress: () {
                clickCounter++;
                setState(() {});
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPress: () {
                if (clickCounter == 0) return;
                clickCounter--;
                setState(() {});
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              icon:  Icons.refresh_rounded,
              onPress: () {
                clickCounter = 0;
                setState(() {});
              },
            ),
          ],
        )
      );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPress;

  const CustomButton({
    super.key, 
    required this.icon, 
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 2,
      enableFeedback: true,
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
