import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StickyContainer(
        displayOverFlowContent: true,
        stickyChildren: [
          StickyWidget(
            initialPosition: StickyPosition(bottom: 20, right: 20),
            finalPosition:
                StickyPosition(bottom: MediaQuery.of(context).size.height - 80, right: 20),
            controller: _controller,
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
              child: const Center(child: Icon(Icons.pause)),
            ),
          ),
        ],
        child: ListView.builder(
            controller: _controller,
            itemCount: 50,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text("Tile $index"),
              );
            })),
      ),
    );
  }
}
