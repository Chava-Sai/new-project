import 'package:flutter/material.dart';

void main() {
  runApp(const AdvancedLayoutsDemoApp());
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

class AdvancedLayoutsDemoApp extends StatelessWidget {
  const AdvancedLayoutsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advanced Layouts Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const AdvancedLayoutsPage(),
    );
  }
}

class AdvancedLayoutsPage extends StatelessWidget {
  const AdvancedLayoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Advanced Layouts')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const DemoSectionTitle('Responsive Row / Column Switch'),
              const SizedBox(height: 8),
              _ResponsiveRowColumn(isWide: isWide),
              const SizedBox(height: 24),
              const DemoSectionTitle('Profile Header (Stack + Positioned)'),
              const SizedBox(height: 8),
              const _ProfileHeader(),
              const SizedBox(height: 24),
              const DemoSectionTitle('Card Grid Using Rows of Expanded'),
              const SizedBox(height: 8),
              _ResponsiveCardGrid(isWide: isWide),
              const SizedBox(height: 24),
              const DemoSectionTitle('Media & Text Layout'),
              const SizedBox(height: 8),
              _MediaTextLayout(isWide: isWide),
            ],
          );
        },
      ),
    );
  }
}

class _ResponsiveRowColumn extends StatelessWidget {
  final bool isWide;
  const _ResponsiveRowColumn({required this.isWide});
  @override
  Widget build(BuildContext context) {
    final children = [
      _ResponsiveBox(label: 'Box 1'),
      _ResponsiveBox(label: 'Box 2'),
      _ResponsiveBox(label: 'Box 3'),
    ];
    return isWide
        ? Row(children: [for (final c in children) Expanded(child: c)])
        : Column(children: [for (final c in children) c]);
  }
}

class _ResponsiveBox extends StatelessWidget {
  final String label;
  const _ResponsiveBox({required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        border: Border.all(color: Colors.teal, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/seed/profilecover/600/200',
                fit: BoxFit.cover,
                height: 160,
                width: 350,
              ),
            ),
            Positioned(
              bottom: -32,
              left: 0,
              right: 0,
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 28,
                  backgroundImage: const NetworkImage(
                    'https://picsum.photos/seed/profileavatar/200',
                  ),
                  onBackgroundImageError: (_, __) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ResponsiveCardGrid extends StatelessWidget {
  final bool isWide;
  const _ResponsiveCardGrid({required this.isWide});
  @override
  Widget build(BuildContext context) {
    const total = 6;
    final cards = List.generate(total, (i) => _FancyMiniCard(index: i + 1));

    if (isWide) {
      return Column(
        children: [
          Row(children: [for (final c in cards.take(3)) Expanded(child: c)]),
          const SizedBox(height: 12),
          Row(children: [for (final c in cards.skip(3)) Expanded(child: c)]),
        ],
      );
    } else {
      return Column(
        children: cards
            .map(
              (c) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: c,
              ),
            )
            .toList(),
      );
    }
  }
}

class _FancyMiniCard extends StatelessWidget {
  final int index;
  const _FancyMiniCard({required this.index});
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 100,
        child: Center(
          child: Text(
            'Card $index',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class _MediaTextLayout extends StatelessWidget {
  final bool isWide;
  const _MediaTextLayout({required this.isWide});
  @override
  Widget build(BuildContext context) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        'https://picsum.photos/seed/mediasample/400/250',
        fit: BoxFit.cover,
        width: isWide ? 200 : double.infinity,
        height: 120,
      ),
    );

    final text = Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'Media & Text Layout',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Demonstrates switching between Row & Column depending on available width.',
          ),
        ],
      ),
    );

    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          Flexible(child: text),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [image, text],
      );
    }
  }
}
