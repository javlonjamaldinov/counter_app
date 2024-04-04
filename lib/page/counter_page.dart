import 'package:flutter/material.dart';
import 'second_page.dart'; // Импортируем SecondPage

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Counter App",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            Text(
              _counter.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _resetCounter();
                  },
                  child: const Icon(Icons.restore),
                ),
                ElevatedButton(
                  onPressed: () {
                    _incrementCounter();
                  },
                  child: const Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () {
                    _decrementCounter();
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () async {
                final updatedCounter = await Navigator.push<int>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(counter: _counter),
                  ),
                );
                if (updatedCounter != null) {
                  setState(() {
                    _counter = updatedCounter;
                  });
                }
              },
              child: Container(
                height: 45,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Prise:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
