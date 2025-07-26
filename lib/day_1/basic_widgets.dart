import 'package:flutter/material.dart';

void main() {
  runApp(const BasicWidgetsDemoApp());
}

class BasicWidgetsDemoApp extends StatelessWidget {
  const BasicWidgetsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Widgets Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(150, 0, 38, 209)!,
        ),
        useMaterial3: true,
      ),
      home: const BasicWidgetsPage(),
    );
  }
}

class BasicWidgetsPage extends StatelessWidget {
  const BasicWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(
          "this is my new app",
          style: TextStyle(color: Colors.white, fontSize: 40),
        ),
        backgroundColor: const Color.fromARGB(255, 88, 2, 218),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          DemoSectionTitle('Text Widgets'),
          _BasicTextExamples(),
          SizedBox(height: 24),
          DemoSectionTitle('Image Widgets'),
          _BasicImageExamples(),
          SizedBox(height: 24),
          DemoSectionTitle('Container & Box Widgets'),
          _BasicContainerExamples(),
          SizedBox(height: 24),
          DemoSectionTitle('Buttons & Icons'),
          _BasicButtonExamples(),
          SizedBox(height: 24),
          DemoSectionTitle('Input Widgets'),
          _BasicInputExamples(),
        ],
      ),
    );
  }
}

class DemoSectionTitle extends StatelessWidget {
  final String text;
  const DemoSectionTitle(this.text, {super.key});
  @override
  Widget build(BuildContext context) => Text(
    text,
    style: Theme.of(
      context,
    ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
  );
}

class _BasicTextExamples extends StatelessWidget {
  const _BasicTextExamples();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text('Hello Flutter!'),
        const SizedBox(height: 12),
        Text(
          'Styled text with bigger font & color',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: Colors.blueAccent),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: const [
              TextSpan(text: 'Rich '),
              TextSpan(
                text: 'Text ',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              TextSpan(
                text: 'with multiple styles',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BasicImageExamples extends StatelessWidget {
  const _BasicImageExamples();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const FlutterLogo(size: 182),
        const SizedBox(width: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://img.freepik.com/free-photo/fuji-mountain-kawaguchiko-lake-morning-autumn-seasons-fuji-mountain-yamanachi-japan_335224-102.jpg?semt=ais_hybrid&w=740',
            width: 170,
            height: 202,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _BasicContainerExamples extends StatelessWidget {
  const _BasicContainerExamples();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          color: const Color.fromARGB(255, 79, 255, 120),
          child: const Text('Simple colored Container with padding'),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 90,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.teal.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.teal, width: 5),
          ),
          child: const Text('Decorated Container (border, radius)'),
        ),
      ],
    );
  }
}

class _BasicButtonExamples extends StatelessWidget {
  const _BasicButtonExamples();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        OutlinedButton(onPressed: () {}, child: const Text('login')),
        OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.security_update_warning_outlined),
        ),
        FloatingActionButton.large(
          onPressed: () {},
          child: const Icon(Icons.person),
        ),
      ],
    );
  }
}

class _BasicInputExamples extends StatelessWidget {
  const _BasicInputExamples();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextField(
          decoration: InputDecoration(
            labelText: 'email',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 12),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'password',
            //border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 12),
        TextField(
          maxLines: 7,
          decoration: InputDecoration(
            labelText: 'Message',
            alignLabelWithHint: true,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
