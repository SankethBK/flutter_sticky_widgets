

<a href="https://github.com/SankethBK/flutter_sticky_widgets/actions"><img src="https://github.com/SankethBK/flutter_sticky_widgets/workflows/test-flutter-sticky-widgets/badge.svg" alt="Build Status"></a>


With *flutter_sticky_widgets* you can use a widget as if it is `position: sticky;` in CSS. 

Sticky widgets is an UI pattern where we want widgets to scroll along with the UI upto a certain point, and then stick to the screen instead of scrolling off the screen.

_(Green play button in first image, and shuffle play button in second image are examples for position: sticky)_

<div style="display:flex; flex-wrap: wrap;">
        <img style="width:300px; padding: 2rem" src="https://user-images.githubusercontent.com/51091231/199050896-614a10e2-b8df-4a3a-9399-9a7de15d191d.gif"> 
        &nbsp; &nbsp; 
        <img style="width:300px; padding: 2rem" src="https://user-images.githubusercontent.com/51091231/199096881-6f54e3ae-91a3-498e-a51d-4cf72c99151c.gif">
</div>

## Getting started

```dart
import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';
```

```dart
StickyContainer(
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
    );
```

#### StickyWidget

Widget used to implement the sticky pattern. 

* __initialPosition (StickyPosition):__ indicates the position of the widget before the scrolling has started. Position is represented by a custom class *StickyPosition*. 

* __finalPosition (StickyPosition):__ indicates the position of the widget where it will remain sticky after sufficient amount of scrolling. Widget will return to its initial position if scrolled in reverse direction. 

* __controller (ScrollController):__ used by StickyWidget to detect scrolling. Same ScrollController must be attached to your *Scrollable* (ListView, SingleChildScrollView, CustomScrollView, ...) for StickyWidgets to work. It is also used to determine if the scroll axis is vertical or horizontal. 

* __callback (Function(double)?) (optional):__ An optional callback function, which gets called on every scroll. It receives *scrolloffset* as parameter which can be used to animate the *StickyWidget*. 

#### StickyContainer

It must be the parent element of the *Scrollable* widget used. StickyContainer's size is used as reference size by StickWidgets to position themselves. So make sure StickyContainer's size is same as the size of the *Scrollable* widget. 

* __child (Widget):__ ideally *Scrollable* widget should be supplied for this parameter, if not you have to make sure StickyContainer's size is same as *Scrollable's* size.

* __stickyChildren (List<StickyWidget>):__ you can supply one or more *StickyWidgets*.

* __displayOverFlowContent (bool) (optional):__ true if you want to display the StickyWidgets overflowing outside of the StickyContainer's bounds. 
 
#### StickyPosition

A Custom class used to represent initial and final positions of *StickyWidget*. It takes 4 parameters (top, bottom, left, right). But you should supply only 2 of them (top / bottom, right / left)

Note: `Make sure to pass same set of parameters for StickyPosition used in initialPosition and finalPosition`

Eg: 

Correct ✅
initialPosition: StickyPosition(top: .., left: ..)  
finalPosition: StickyPosition(top: .., left: ..) 

Wrong ❌ (should supply top instead of bottom for finalPosition also)


initialPosition: StickyPosition(top: .., left: ..)  
finalPosition: StickyPosition(bottom: .., left: ..) 

