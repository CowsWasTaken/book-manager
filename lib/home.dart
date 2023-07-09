import 'package:bookmanager/src/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'BrightnessButton.dart';
import 'ColorSeedButton.dart';
import 'app_state.dart';
import 'constants.dart';

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

  int _selectedPageIndex = 0;

  int _counter = 0;

  int screenIndex = ScreenSelected.component.value;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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
            style: Theme.of(context).textTheme.headlineMedium,
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
        body: Column(
          children: [
            Consumer<ApplicationState>(
              builder: (context, appState, _) => AuthFunc(
                  loggedIn: appState.loggedIn,
                  signOut: () {
                    FirebaseAuth.instance.signOut();
                  }),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                // Zum Beispiel: Setzen Sie dies auf die tatsächliche Anzahl der Elemente, die Sie anzeigen möchten
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Card(
                        color: Theme.of(context).cardColor,
                        child: ListTile(
                          leading: const Icon(
                            Icons.abc,
                            size: 50,
                          ),
                          title: Text('Item $index'),
                          subtitle: Text('Subtitle for $index'),
                          // Fügen Sie hier zusätzliche Felder wie Untertitel, führende und nachfolgende Widgets hinzu, je nach Bedarf
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar:
            getNavbar() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  getNavbar() {
    return NavigationBar(
      selectedIndex: _selectedPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedPageIndex = index;
        });
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(
          selectedIcon: Icon(Icons.bookmark),
          icon: Icon(Icons.bookmark_border),
          label: 'For Later',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.library_books),
          icon: Icon(Icons.library_books_outlined),
          label: 'Reading',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.task),
          icon: Icon(Icons.task_outlined),
          label: 'Done',
        ),
      ],
    );
  }
}
