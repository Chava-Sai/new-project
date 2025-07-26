import 'package:flutter/material.dart';

/// --------------------------------------------------------------
/// Flutter Widget & Layout Demos
/// --------------------------------------------------------------
/// This single `main.dart` file contains 4 demo screens you can use
/// in class to teach foundational Flutter widgets & layout concepts.
///
/// A) Widgets
///    1. BasicWidgetsPage   – quick tour of Text, Image, Container, etc.
///    2. AdvancedWidgetsPage – richer UI: gradients, rounded images,
///       animated container, cards, custom fonts (commented), etc.
///
/// B) Layouts (Row, Column, Stack)
///    3. BasicLayoutsPage    – minimal Row / Column / Stack examples.
///    4. AdvancedLayoutsPage  – responsive & composed layouts that show
///       how Row/Column/Stack combine to build real UIs.
///
/// NOTE: Network images require internet permission on Android.
///       For offline demos, swap Image.network with FlutterLogo or
///       an AssetImage you bundle in pubspec.yaml.
/// --------------------------------------------------------------

void main() {
  runApp(const WidgetLayoutDemoApp());
}

class WidgetLayoutDemoApp extends StatelessWidget {
  const WidgetLayoutDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget & Layout Demos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const DemoHomePage(),
    );
  }
}

/// Home launcher that lists all demo screens.
class DemoHomePage extends StatelessWidget {
  const DemoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final demos = <_DemoEntry>[
      _DemoEntry(
        'A1: Basic Widgets',
        Icons.widgets_outlined,
        const BasicWidgetsPage(),
      ),
      _DemoEntry(
        'A2: Advanced Widgets',
        Icons.auto_awesome,
        const AdvancedWidgetsPage(),
      ),
      _DemoEntry(
        'B1: Basic Layouts (Row/Column/Stack)',
        Icons.view_column,
        const BasicLayoutsPage(),
      ),
      _DemoEntry(
        'B2: Advanced Layouts',
        Icons.grid_view,
        const AdvancedLayoutsPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Widget & Layout Demos')),
      body: ListView.separated(
        itemCount: demos.length,
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemBuilder: (context, i) {
          final d = demos[i];
          return ListTile(
            leading: Icon(d.icon),
            title: Text(d.title),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => d.page),
            ),
          );
        },
      ),
    );
  }
}

class _DemoEntry {
  final String title;
  final IconData icon;
  final Widget page;
  _DemoEntry(this.title, this.icon, this.page);
}

// --------------------------------------------------------------
// A1) BASIC WIDGETS PAGE
// --------------------------------------------------------------
class BasicWidgetsPage extends StatelessWidget {
  const BasicWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic Widgets')),
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
        const SizedBox(height: 8),
        Text(
          'Styled text with bigger font & color',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: Colors.teal),
        ),
        const SizedBox(height: 8),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: const [
              TextSpan(text: 'Rich '),
              TextSpan(
                text: 'Text ',
                style: TextStyle(fontWeight: FontWeight.bold),
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
        const FlutterLogo(size: 72),
        const SizedBox(width: 16),
        // Simple network image (random placeholder)
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            'https://picsum.photos/seed/basic/120',
            width: 120,
            height: 72,
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
          padding: const EdgeInsets.all(16),
          color: Colors.amber.shade300,
          child: const Text('Simple colored Container with padding'),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.teal.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.teal, width: 2),
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
        ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
        OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.thumb_up_alt_outlined),
        ),
        FloatingActionButton.small(
          onPressed: () {},
          child: const Icon(Icons.add),
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
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 12),
        TextField(
          maxLines: 3,
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

// --------------------------------------------------------------
// A2) ADVANCED WIDGETS PAGE
// --------------------------------------------------------------
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
                  colors: [Colors.teal, Colors.purple, Colors.orange],
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
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person)),
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
                colors: [Colors.teal.shade400, Colors.blue.shade400],
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
          const SizedBox(height: 48),
          const Text(
            'Tip: Add custom fonts in pubspec.yaml, then use theme.textTheme with fontFamily.',
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
                    fontSize: 20,
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
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: boxSize,
        height: boxSize,
        decoration: boxDecoration,
        alignment: Alignment.center,
        child: const Text('Animate me!', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

// --------------------------------------------------------------
// B1) BASIC LAYOUTS PAGE (Row, Column, Stack)
// --------------------------------------------------------------
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

// --------------------------------------------------------------
// B2) ADVANCED LAYOUTS PAGE
// --------------------------------------------------------------
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
              const SizedBox(height: 48),
              Text(
                'Tip: Use Expanded, Flexible, Spacer to control how children share space in Row/Column.',
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Switches between a horizontal Row (wide screens) and vertical Column (narrow).
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

/// Profile header: background image + avatar that overlaps using Stack.
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
            // Cover photo
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/seed/profilecover/600/200',
                fit: BoxFit.cover,
                height: 160,
                width: 350,
              ),
            ),
            // Circular avatar positioned partially outside bottom center
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

/// Responsive grid built manually with Rows of Expanded children.
class _ResponsiveCardGrid extends StatelessWidget {
  final bool isWide;
  const _ResponsiveCardGrid({required this.isWide});
  @override
  Widget build(BuildContext context) {
    // We'll create 6 sample cards.
    const total = 6;
    final cards = List.generate(total, (i) => _FancyMiniCard(index: i + 1));

    if (isWide) {
      // 3 columns x 2 rows (approx) when wide.
      return Column(
        children: [
          Row(children: [for (final c in cards.take(3)) Expanded(child: c)]),
          const SizedBox(height: 12),
          Row(children: [for (final c in cards.skip(3)) Expanded(child: c)]),
        ],
      );
    } else {
      // Single column list when narrow.
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

/// Media + Text layout: On wide, show Row (image left, text right). On narrow, Column.
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
        width: isWide ? 200 : double.infinity, // Full width when in column
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
            'Demonstrates switching between Row & Column depending on available width. Useful for tablets vs phones.',
          ),
        ],
      ),
    );

    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image,
          Flexible(child: text), // Use Flexible instead of Expanded
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

// --------------------------------------------------------------
// END OF FILE
// --------------------------------------------------------------
