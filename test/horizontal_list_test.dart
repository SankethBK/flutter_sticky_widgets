import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_sticky_widgets/flutter_sticky_widgets.dart';

import 'widgets/horizontal_list.dart';

void main() {
  Widget buildApp(
      StickyPosition initialPosition, StickyPosition finalScrollPosition) {
    return HorizontalList(
        initialPosition: initialPosition, finalPosition: finalScrollPosition);
  }

  group("Test horizontal list with right position", () {
    testWidgets("Full scroll", (WidgetTester tester) async {
      await tester.pumpWidget(buildApp(StickyPosition(right: 0, bottom: 20),
          StickyPosition(right: 300, bottom: 20)));

      // initial position
      expect(find.text("0.0"), findsOneWidget);
      expect(find.byType(Scrollable), findsOneWidget);

      // scroll till the last item

      final listFinder = find.byType(Scrollable);
      final itemFinder = find.text("item 29");

      await tester.scrollUntilVisible(
        itemFinder,
        100.0,
        scrollable: listFinder,
      );

      expect(find.text("300.0"), findsOneWidget);
    });

    testWidgets("Half scroll", (WidgetTester tester) async {
      await tester.pumpWidget(buildApp(StickyPosition(right: 0, bottom: 20),
          StickyPosition(right: 300, bottom: 20)));

      // initial position
      expect(find.text("0.0"), findsOneWidget);
      expect(find.byType(Scrollable), findsOneWidget);

      // scroll till the last item
      final listView = tester.widget<ListView>(find.byType(ListView));
      final ctrl = listView.controller;

      ctrl?.jumpTo(ctrl.offset + 150);
      await tester.pump();

      expect(find.text("150.0"), findsOneWidget);
    });

    testWidgets(
        "Should not immediately scroll left after reaching right and list is scrolled left",
        (WidgetTester tester) async {
      await tester.pumpWidget(buildApp(StickyPosition(right: 0, bottom: 20),
          StickyPosition(right: 300, bottom: 20)));

      // initial position
      expect(find.text("0.0"), findsOneWidget);
      expect(find.byType(Scrollable), findsOneWidget);

      // scroll down by 350 px

      await tester.drag(find.byType(ListView), const Offset(-350.0, 0.0));
      await tester.pump();

      expect(find.text("300.0"), findsOneWidget);

      // scroll up by 25px. sticky widget still expected to be at 325px

      await tester.drag(find.byType(ListView), const Offset(25.0, 0.0));
      await tester.pump();

      expect(find.text("300.0"), findsOneWidget);

      // scroll up by 75px. sticky widget  expected to be at 275px

      await tester.drag(find.byType(ListView), const Offset(50.0, 0.0));
      await tester.pump();

      expect(find.text("275.0"), findsOneWidget);
    });
  });

  group("Test horizontal list with top position", () {
    testWidgets("Full scroll", (WidgetTester tester) async {
      await tester.pumpWidget(buildApp(StickyPosition(left: 0, bottom: 20),
          StickyPosition(left: 300, bottom: 20)));
      // initial position
      expect(find.text("0.0"), findsOneWidget);
      expect(find.byType(Scrollable), findsOneWidget);

      // scroll till the last item

      final listFinder = find.byType(Scrollable);
      final itemFinder = find.text("item 29");

      await tester.scrollUntilVisible(
        itemFinder,
        100.0,
        scrollable: listFinder,
      );

      expect(find.text("300.0"), findsOneWidget);
    });

    testWidgets("Half scroll", (WidgetTester tester) async {
      await tester.pumpWidget(buildApp(StickyPosition(left: 0, bottom: 20),
          StickyPosition(left: 300, bottom: 20)));

      // initial position
      expect(find.text("0.0"), findsOneWidget);
      expect(find.byType(Scrollable), findsOneWidget);

      // scroll till the last item
      final listView = tester.widget<ListView>(find.byType(ListView));
      final ctrl = listView.controller;

      ctrl?.jumpTo(ctrl.offset + 150);
      await tester.pump();

      expect(find.text("150.0"), findsOneWidget);
    });

    testWidgets(
        "Should not immediately scroll down after reaching top and list is scrolled down",
        (WidgetTester tester) async {
      await tester.pumpWidget(buildApp(StickyPosition(left: 0, bottom: 20),
          StickyPosition(left: 300, bottom: 20)));

      // initial position
      expect(find.text("0.0"), findsOneWidget);
      expect(find.byType(Scrollable), findsOneWidget);

      // scroll down by 350 px

      await tester.drag(find.byType(ListView), const Offset(-350.0, 0.0));
      await tester.pump();

      expect(find.text("300.0"), findsOneWidget);

      // scroll up by 25px. sticky widget still expected to be at 325px

      await tester.drag(find.byType(ListView), const Offset(25.0, 0.0));
      await tester.pump();

      expect(find.text("300.0"), findsOneWidget);

      // scroll up by 75px. sticky widget  expected to be at 275px

      await tester.drag(find.byType(ListView), const Offset(50.0, 0.0));
      await tester.pump();

      expect(find.text("275.0"), findsOneWidget);
    });
  });
}
