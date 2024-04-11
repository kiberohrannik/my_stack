import 'package:flutter/material.dart';
import 'package:my_stack/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

const String overflowUrl = 'https://stackoverflow.com/';
const String exchangeUrl = 'https://stackexchange.com/';

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // bool _overflowSelected = false;
  // bool _exchangeSelected = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onStackOverflowTapped() async {
    // setState(() {
    //   _overflowSelected = !_overflowSelected;
    //   _exchangeSelected = false;
    // });

    var uri = Uri.parse(overflowUrl);
    if(!await launchUrl(uri)) {
      throw Exception("Can't open url in browser!");
    }
  }

  void _onStackExchangeTapped() async {
    // setState(() {
    //   _exchangeSelected = !_exchangeSelected;
    //   _overflowSelected = false;
    // });

    var uri = Uri.parse(exchangeUrl);
    if(!await launchUrl(uri)) {
    throw Exception("Can't open url in browser!");
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backColor = Theme.of(context).colorScheme.inversePrimary;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        backgroundColor: FlowColor.backWhite,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xffecc148)), //Color(0xffecc148)
                child: Text(
              'To explore',
              textAlign: TextAlign.center,
            )),
            ListTile(
              splashColor: FlowColor.accentOrange,
              title: Text('StackOverflow'),
              // selectedTileColor: FlowColor.backYellow,
              onTap: () => _onStackOverflowTapped(),
            ),

            ListTile(
              title: Text('StackExchange'),
                splashColor: FlowColor.backBlue,
                onTap: () => _onStackExchangeTapped()
            ),

            ListTile(
              title: Text('Timer'),
              leading: Icon(Icons.timer),
              selectedTileColor: FlowColor.backYellow,
              selected: false,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
