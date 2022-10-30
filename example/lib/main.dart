import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_buttons.dart';

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
      appBar: AppBar(title: const Text("Sticky widgets example")),
      body: StickyContainer(
        stickyChildren: [
          StickyWidget(
            initialPosition: StickyPosition(
                top: MediaQuery.of(context).size.height - 100, right: 30),
            finalPosition: StickyPosition(top: 0, right: 30),
            controller: _controller,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(Icons.pause, size: 20),
            ),
          ),
          StickyWidget(
            initialPosition: StickyPosition(
                bottom: MediaQuery.of(context).size.height - 100, left: 30),
            finalPosition: StickyPosition(bottom: 0, left: 30),
            controller: _controller,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(Icons.play_arrow, size: 20),
            ),
          )
        ],
        child: ListView.builder(
            controller: _controller,
            itemCount: 30,
            itemBuilder: ((context, index) {
              return ListTile(
                title: Text("Tile $index"),
              );
            })),
      ),
    );
  }
}
