import 'package:book_manager/typography_screen.dart';
import 'package:flutter/material.dart';

import 'BrightnessButton.dart';
import 'ColorSeedButton.dart';
import 'color_palettes_screen.dart';
import 'component_screen.dart';
import 'constants.dart';
import 'elevation_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage(
      {super.key,
        required this.title,
        required this.useLightMode,
        required this.colorSelected,
        required this.colorSelectionMethod,
        required this.handleBrightnessChange,
        required this.handleColorSelect});

  final String title;
  final bool useLightMode;
  final ColorSeed colorSelected;
  final ColorSelectionMethod colorSelectionMethod;

  final void Function(bool useLightMode) handleBrightnessChange;
  final void Function(int value) handleColorSelect;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int _counter = 0;

  int screenIndex = ScreenSelected.component.value;


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget createScreenFor(
      ScreenSelected screenSelected, bool showNavBarExample) {
    switch (screenSelected) {
      case ScreenSelected.component:
        return componentText();
      case ScreenSelected.color:
        return const ColorPalettesScreen();
      case ScreenSelected.typography:
        return const TypographyScreen();
      case ScreenSelected.elevation:
        return const ElevationScreen();
    }
  }

  Widget componentText() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Flexible(
              child: BrightnessButton(
                handleBrightnessChange: widget.handleBrightnessChange,
              )),
          Flexible(
              child: ColorSeedButton(
                  colorSelected: widget.colorSelected,
                  colorSelectionMethod: widget.colorSelectionMethod,
                  handleColorSelect: widget.handleColorSelect))
        ],
      ),
      body: FirstComponentList(
        scaffoldKey: scaffoldKey,
        showNavBottomBar: true,
        showSecondList: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
