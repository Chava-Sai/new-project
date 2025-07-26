// import 'package:flutter/material.dart';

// void main() {
//   runApp(const BasicWidgetsDemo());
// }

// class BasicWidgetsDemo extends StatelessWidget {
//   const BasicWidgetsDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Basic Widgets Demo'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Text Widget
//               const Text(
//                 'Hello Flutter!',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Image Widget (from network)
//               Image.network(
//                 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
//                 width: 150,
//                 height: 150,
//               ),
//               const SizedBox(height: 20),

//               // Container Widget
//               Container(
//                 width: 200,
//                 height: 80,
//                 decoration: BoxDecoration(
//                   color: Colors.amber,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                     color: Colors.orange,
//                     width: 2,
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Container',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Icon Widget
//               const Icon(
//                 Icons.favorite,
//                 color: Colors.red,
//                 size: 50,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//--------------------

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const AdvancedWidgetsDemo());
// }

// class AdvancedWidgetsDemo extends StatelessWidget {
//   const AdvancedWidgetsDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.indigo,
//         fontFamily: 'Roboto',
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Advanced Widgets Demo'),
//           elevation: 10,
//         ),
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [Colors.indigo, Colors.purple],
//             ),
//           ),
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Fancy Text with multiple styles
//                   RichText(
//                     text: const TextSpan(
//                       text: 'Fancy ',
//                       style: TextStyle(
//                         fontSize: 28,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                         shadows: [
//                           Shadow(
//                             blurRadius: 10,
//                             color: Colors.black,
//                             offset: Offset(2, 2),
//                           ),
//                         ],
//                       ),
//                       children: [
//                         TextSpan(
//                           text: 'Text',
//                           style: TextStyle(
//                             color: Colors.amber,
//                             fontStyle: FontStyle.italic,
//                             decoration: TextDecoration.underline,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 30),

//                   // Circular Avatar Image with border
//                   Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 4,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.3),
//                           spreadRadius: 5,
//                           blurRadius: 7,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: const CircleAvatar(
//                       radius: 70,
//                       backgroundImage: NetworkImage(
//                         'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),

//                   // Animated Container
//                   AnimatedContainer(
//                     duration: const Duration(seconds: 1),
//                     width: 250,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [Colors.pink, Colors.purple],
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.3),
//                           spreadRadius: 3,
//                           blurRadius: 10,
//                           offset: const Offset(0, 5),
//                         ),
//                       ],
//                     ),
//                     child: const Center(
//                       child: Text(
//                         'Animated Container',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 30),

//                   // Custom Icon with gradient
//                   ShaderMask(
//                     shaderCallback: (Rect bounds) {
//                       return const LinearGradient(
//                         colors: [Colors.blue, Colors.green],
//                       ).createShader(bounds);
//                     },
//                     child: const Icon(
//                       Icons.star,
//                       size: 60,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ---------------------

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const BasicLayoutsDemo());
// }

// class BasicLayoutsDemo extends StatelessWidget {
//   const BasicLayoutsDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Basic Layouts Demo'),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Row Example
//                 const Text(
//                   'Row Layout:',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Container(width: 50, height: 50, color: Colors.red),
//                       Container(width: 50, height: 50, color: Colors.green),
//                       Container(width: 50, height: 50, color: Colors.blue),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 // Column Example
//                 const Text(
//                   'Column Layout:',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Column(
//                     children: [
//                       Container(width: 100, height: 50, color: Colors.amber),
//                       const SizedBox(height: 10),
//                       Container(width: 100, height: 50, color: Colors.purple),
//                       const SizedBox(height: 10),
//                       Container(width: 100, height: 50, color: Colors.teal),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 // Stack Example
//                 const Text(
//                   'Stack Layout:',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   height: 150,
//                   child: Stack(
//                     children: [
//                       Container(
//                         width: 150,
//                         height: 150,
//                         color: Colors.blue,
//                       ),
//                       Positioned(
//                         top: 20,
//                         left: 20,
//                         child: Container(
//                           width: 100,
//                           height: 100,
//                           color: Colors.green.withOpacity(0.7),
//                         ),
//                       ),
//                       Positioned(
//                         top: 40,
//                         left: 40,
//                         child: Container(
//                           width: 50,
//                           height: 50,
//                           color: Colors.red.withOpacity(0.7),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// ----------------------

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const AdvancedLayoutsDemo());
// }

// class AdvancedLayoutsDemo extends StatelessWidget {
//   const AdvancedLayoutsDemo({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(primarySwatch: Colors.deepPurple),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Advanced Layouts Demo'),
//           centerTitle: true,
//         ),
//         body: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Colors.white, Color(0xFFE1F5FE)],
//             ),
//           ),
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Complex Row Example
//                 const Text(
//                   'Responsive Row with Flexible Widgets',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 15),
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Row(
//                       children: [
//                         Flexible(
//                           flex: 2,
//                           child: Container(
//                             height: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.deepPurple,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: const Center(
//                               child: Text(
//                                 'Flex: 2',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Flexible(
//                           flex: 3,
//                           child: Container(
//                             height: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.amber,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: const Center(
//                               child: Text(
//                                 'Flex: 3',
//                                 style: TextStyle(color: Colors.black),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Flexible(
//                           flex: 1,
//                           child: Container(
//                             height: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.teal,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: const Center(
//                               child: Text(
//                                 'Flex: 1',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 // Complex Column Example
//                 const Text(
//                   'Column with Expanded and Spacer',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 15),
//                 Card(
//                   child: SizedBox(
//                     height: 300,
//                     child: Padding(
//                       padding: const EdgeInsets.all(15),
//                       child: Column(
//                         children: [
//                           Expanded(
//                             flex: 2,
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: Colors.pink[100],
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: const Center(
//                                 child: Text(
//                                   'Expanded (flex:2)',
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const Spacer(flex: 1),
//                           Expanded(
//                             flex: 3,
//                             child: Container(
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: Colors.blue[100],
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: const Center(
//                                 child: Text(
//                                   'Expanded (flex:3)',
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 // Complex Stack Example
//                 const Text(
//                   'Stack with Positioned and Align',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 15),
//                 Card(
//                   child: SizedBox(
//                     height: 250,
//                     child: Stack(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.grey[200],
//                           ),
//                         ),
//                         Positioned(
//                           top: 20,
//                           left: 20,
//                           child: Container(
//                             width: 100,
//                             height: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.red[200],
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Center(child: Text('Top Left')),
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 20,
//                           right: 20,
//                           child: Container(
//                             width: 100,
//                             height: 100,
//                             decoration: BoxDecoration(
//                               color: Colors.blue[200],
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Center(child: Text('Bottom Right')),
//                           ),
//                         ),
//                         const Align(
//                           alignment: Alignment.center,
//                           child: Text(
//                             'Center',
//                             style: TextStyle(
//                               fontSize: 24,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 20,
//                           right: 20,
//                           child: Container(
//                             width: 50,
//                             height: 50,
//                             decoration: const BoxDecoration(
//                               color: Colors.green,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(Icons.star, color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 // Combined Layout Example
//                 const SizedBox(height: 30),
//                 const Text(
//                   'Combined Layout: Column of Rows',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 15),
//                 Card(
//                   child: Padding(
//                     padding: const EdgeInsets.all(15),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 height: 60,
//                                 color: Colors.purple[100],
//                                 child: const Center(
//                                   child: Text('Row 1 - Item 1'),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Container(
//                                 height: 60,
//                                 color: Colors.purple[200],
//                                 child: const Center(
//                                   child: Text('Row 1 - Item 2'),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Row(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: Container(
//                                 height: 80,
//                                 color: Colors.blue[100],
//                                 child: const Center(
//                                   child: Text('Row 2 - Item 1 (flex:2)'),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 1,
//                               child: Container(
//                                 height: 80,
//                                 color: Colors.blue[200],
//                                 child: const Center(
//                                   child: Text('Row 2 - Item 2 (flex:1)'),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 10),
//                         Stack(
//                           children: [
//                             Container(
//                               height: 100,
//                               decoration: BoxDecoration(
//                                 color: Colors.green[100],
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             const Positioned.fill(
//                               child: Center(child: Text('Stack inside Column')),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
