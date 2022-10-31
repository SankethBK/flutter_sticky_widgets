import 'package:flutter/material.dart';
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';

class VerticalList extends StatefulWidget {
  final StickyPosition initialPosition;
  final StickyPosition finalPosition;
  const VerticalList(
      {Key? key, required this.initialPosition, required this.finalPosition})
      : super(key: key);

  @override
  State<VerticalList> createState() => _VerticalListState();
}

class _VerticalListState extends State<VerticalList> {
  double buttonText = 0;

  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: 300,
          child: StickyContainer(
            stickyChildren: [
              StickyWidget(
                callback: (double scrollffset) => setState(() {
                  buttonText = scrollffset;
                }),
                initialPosition: widget.initialPosition,
                finalPosition: widget.finalPosition,
                controller: controller,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: Center(child: Text("$buttonText")),
                ),
              )
            ],
            child: ListView.builder(
              itemCount: 30,
              controller: controller,
              itemBuilder: (context, index) => SizedBox(
                height: 30,
                child: Text("item $index"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
