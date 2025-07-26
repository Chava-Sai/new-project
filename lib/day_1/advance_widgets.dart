import 'package:flutter/material.dart';

void main() {
  runApp(const AdvancedWidgetsDemoApp());
}

class AdvancedWidgetsDemoApp extends StatelessWidget {
  const AdvancedWidgetsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Widgets Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const AdvancedWidgetsPage(),
    );
  }
}

class AdvancedWidgetsPage extends StatefulWidget {
  const AdvancedWidgetsPage({super.key});
  @override
  State<AdvancedWidgetsPage> createState() => _AdvancedWidgetsPageState();
}

class _AdvancedWidgetsPageState extends State<AdvancedWidgetsPage> {
  double _boxSize = 100;
  bool _useGradient = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Widgets')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const DemoSectionTitle('Gradient Text'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Colors.teal,
                    Colors.purple,
                    Colors.orange,
                    Colors.cyan,
                    Colors.black,
                  ],
                ).createShader(bounds);
              },
              child: Text(
                'Flutter is Flexible!',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const DemoSectionTitle('Rounded / Clipped Image Card'),
          const SizedBox(height: 8),
          _RoundedImageCard(
            imageUrl: 'https://picsum.photos/seed/adv1/600/300',
            title: 'Beautiful Mountains',
            subtitle: 'Demonstrates ClipRRect + Stack overlay',
          ),
          const SizedBox(height: 24),
          const DemoSectionTitle('AnimatedContainer Demo'),
          const SizedBox(height: 8),
          _AnimatedSizeDemo(boxSize: _boxSize, useGradient: _useGradient),
          const SizedBox(height: 12),
          Text('Size: ${_boxSize.toStringAsFixed(0)}'),
          Slider(
            min: 50,
            max: 300,
            value: _boxSize,
            onChanged: (v) => setState(() => _boxSize = v),
          ),
          SwitchListTile(
            title: const Text('Use Gradient Background'),
            value: _useGradient,
            onChanged: (v) => setState(() => _useGradient = v),
          ),
          const SizedBox(height: 24),
          const DemoSectionTitle('Card + ListTile + Avatar'),
          const SizedBox(height: 8),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.settings)),
              title: const Text('Card Example'),
              subtitle: const Text('Using ListTile inside a Card'),
              trailing: IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(height: 24),
          const DemoSectionTitle('Custom Decorated Container'),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.teal.shade400,
                  Colors.blue.shade400,
                  Colors.red,
                  Colors.yellow,
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Text(
              'This container shows gradient + shadow + radius.',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundedImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  const _RoundedImageCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(subtitle, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedSizeDemo extends StatelessWidget {
  final double boxSize;
  final bool useGradient;
  const _AnimatedSizeDemo({required this.boxSize, required this.useGradient});
  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      color: useGradient ? null : Colors.deepOrange,
      gradient: useGradient
          ? const LinearGradient(colors: [Colors.pink, Colors.orange])
          : null,
      borderRadius: BorderRadius.circular(16),
    );
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 900),
        curve: Curves.elasticIn,
        width: boxSize,
        height: boxSize,
        decoration: boxDecoration,
        alignment: Alignment.center,
        child: const Text('Animate me!', style: TextStyle(color: Colors.white)),
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
