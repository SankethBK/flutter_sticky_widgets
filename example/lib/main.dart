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
    double buttonText = 0;
    return Scaffold(
      appBar: AppBar(title: const Text("Sticky widgets example")),
      body: StickyContainer(
        stickyChildren: [
          StatefulBuilder(builder: (context, setState) {
            return StickyWidget(
              callback: (double scrollOffset) => setState(() {
                buttonText = scrollOffset;
              }),
              initialPosition: StickyPosition(bottom: 100, right: 0),
              finalPosition: StickyPosition(
                  bottom: 100, right: MediaQuery.of(context).size.width - 30),
              controller: _controller,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(child: Text("$buttonText")),
              ),
            );
          }),
          StickyWidget(
            initialPosition: StickyPosition(top: 0, left: 30),
            finalPosition: StickyPosition(
                top: 0, left: MediaQuery.of(context).size.width - 30),
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
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: 30,
            itemBuilder: ((context, index) {
              return Container(
                width: 100,
                color: Colors.pinkAccent,
                child: Center(child: Text("Tile $index")),
              );
            })),
      ),
    );
  }
}
