import 'package:flutter/material.dart';

void main() {
  runApp(const BasicLayoutsDemoApp());
}

class DemoSectionTitle extends StatelessWidget {
  final String text;
  const DemoSectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
  );
}

class BasicLayoutsDemoApp extends StatelessWidget {
  const BasicLayoutsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Layouts Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const BasicLayoutsPage(),
    );
  }
}

class BasicLayoutsPage extends StatelessWidget {
  const BasicLayoutsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Layouts')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          DemoSectionTitle('Row Example'),
          SizedBox(height: 8),
          _BasicRowExample(),
          SizedBox(height: 24),
          DemoSectionTitle('Column Example'),
          SizedBox(height: 8),
          _BasicColumnExample(),
          SizedBox(height: 24),
          DemoSectionTitle('Row + Column Nesting'),
          SizedBox(height: 8),
          _BasicNestedExample(),
          SizedBox(height: 24),
          DemoSectionTitle('Stack Example'),
          SizedBox(height: 8),
          _BasicStackExample(),
        ],
      ),
    );
  }
}

class _ColoredBox extends StatelessWidget {
  final Color color;
  final String label;
  const _ColoredBox(this.color, this.label);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _BasicRowExample extends StatelessWidget {
  const _BasicRowExample();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _ColoredBox(Colors.red, '1'),
        _ColoredBox(Colors.green, '2'),
        _ColoredBox(Colors.blue, '3'),
      ],
    );
  }
}

class _BasicColumnExample extends StatelessWidget {
  const _BasicColumnExample();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ColoredBox(Colors.purple, 'A'),
        SizedBox(height: 12),
        _ColoredBox(Colors.orange, 'B'),
        SizedBox(height: 12),
        _ColoredBox(Colors.teal, 'C'),
      ],
    );
  }
}

class _BasicNestedExample extends StatelessWidget {
  const _BasicNestedExample();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _ColoredBox(Colors.indigo, 'R1'),
            SizedBox(width: 12),
            _ColoredBox(Colors.indigoAccent, 'R2'),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _ColoredBox(Colors.lightBlue, 'R3'),
            SizedBox(width: 12),
            _ColoredBox(Colors.lightBlueAccent, 'R4'),
          ],
        ),
      ],
    );
  }
}

class _BasicStackExample extends StatelessWidget {
  const _BasicStackExample();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 120,
        height: 120,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 120, height: 120, color: Colors.grey.shade300),
            Container(width: 90, height: 90, color: Colors.grey.shade500),
            Container(width: 60, height: 60, color: Colors.grey.shade700),
            const Icon(Icons.layers, color: Colors.white, size: 32),
          ],
        ),
      ),
    );
  }
}